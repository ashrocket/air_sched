ActiveAdmin.register Brand, as: 'Brands' do
  menu priority: 2,  :parent => 'Config'

  filter :brand_key, filters: [:cont, :eq, :start, :end]
  filter :report_keys
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :brand_key, :report_keys, :name,  :description,
                :default_currency,  :active, report_key_ids: [], host_ids: [],
                settings_attributes: [:route_map_filename,
                                      :default_currency,
                                      :max_segments,
                                      :schedule_load_timeout]




  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  # form do |f|
  #     f.inputs do
  #       f.input :brand_key
  #       f.input :name
  #       f.input :description
  #       f.input :report_keys
  #       f.input :host_map, as: :text
  #       f.input :active
  #       f.input :default_currency
  #     end
  #     f.actions
  # end

  index do


       column :brand_key
       column :name

       column :states do |brand|
         def state_helper_content(state, state_reset_path)
             content_tag(:li, class: 'list-group-item list-group-item-warning') do
               li_content = ""
               li_content << content_tag(:div, state )
               li_content << content_tag(:div, class:'btn btn-sm btn-default'){
                                      link_to("reset", state_reset_path)
               }
               li_content.html_safe
             end
         end
         content_tag :ul, class: 'list-group' do
          content = ""
            if  brand.export_state.idle?
             content << content_tag(:li,  'idle', class: 'list-group-item list-group-item-info')
            else
              content << state_helper_content(brand.export_state.current_state,
                                              reset_export_state_admin_brand_path(brand))
            end

            if  brand.data_state.idle?
              content <<  content_tag(:li, 'idle', class: 'list-group-item list-group-item-info')
            else
              content << state_helper_content(brand.data_state.current_state,
                                              reset_data_state_admin_brand_path(brand))

            end
          content.html_safe
         end
       end

       column :description

       column :report_keys do |brand|
         content_tag :ul, class: 'list-group' do
           brand.report_keys.collect{ |rk|
             content_tag(:li, class: 'list-group-item') do
                link_to(rk.name, admin_report_key_path(rk))
             end
           }.join.html_safe
         end
       end

       column :hosts  do |brand|
         content_tag :ul, class: 'list-group' do
           brand.hosts.collect{ |h|
             content_tag(:li, class: 'list-group-item') do
               link_to(h.name, [:admin,h])
             end
           }.join.html_safe
         end
       end
       column :default_currency do |brand|
         brand.settings.default_currency
       end
       column :max_segments do |brand|
         brand.settings.max_segments
       end

       actions
  end
  member_action :build_connections do
   @brand = Brand.friendly.find(params[:id])
   if @brand.data_state.idle?
     @brand.data_state.build_connections!
     redirect_to :back, notice: 'Beginning to build Branded Connections ...'
   else
     redirect_to :back, alert: 'Already building Branded Connections! - In Progress'
   end
  end

  member_action :build_smart_routes do
    @brand = Brand.friendly.find(params[:id])
    if @brand.data_state.idle?
       @brand.data_state.build_smart_routes!
      redirect_to :back, notice: 'Beginning to build Smart Routes ...'
    else
      redirect_to :back, alert: 'Already building Smart Routes! - In Progress'
    end
  end

  member_action :build_route_maps do
    @brand = Brand.friendly.find(params[:id])

    if @brand.data_state.idle?
      @brand.data_state.build_route_maps!
      redirect_to :back, notice: 'Beginning to build Route Maps ...'
    else
      redirect_to :back, alert: 'Already building Route Maps! - In Progress'
    end
  end


  member_action :full_export_route_maps do
    @brand = Brand.friendly.find(params[:id])

    current_sched_set_ids = @brand.report_keys.map{|report_key| report_key.current_schedule_set_id }

    if current_sched_set_ids.include? nil
      redirect_to :back, alert: 'Not all report_keys have loaded schedules!'
    end

    if @brand.export_state.idle?

      @brand.report_keys.each do |report_key|

        BrandRouteMapsSyncWorker.perform_async({'brand_key': @brand.brand_key, 'report_key': report_key.code, 'schedule_set_id': report_key.current_schedule_set_id} )
      end

      redirect_to :back, notice: 'Beginning to build Full Route Maps and Export (this may take a while)...'
    else
      redirect_to :back, alert: 'In Progress! - Already building build Full Route Maps and Export (this may take a while)'
    end
  end
  # TODO: Move this into a seperate sidekiq worker

  member_action :export_only_route_maps do
     @brand = Brand.friendly.find(params[:id])

     brm = BrandedRouteMap.branded(@brand)
     if brm.blank?
       redirect_to :back, alert: 'No route map is built.  Build a Route map or wait!'
     else
       if @brand.export_state.idle?
          report = BrandRouteMapExportReport.create(brand: @brand)
          report.finalize!
          redirect_to :back, notice: 'Beginning to Export route map...'
       else
          redirect_to :back, alert: 'Export Currently In Progress! - try again later.'
       end
     end

  end

  member_action :validate_route_map do
     @brand = Brand.friendly.find(params[:id])
     if @brand.export_state.idle?
      report = BrandedRouteMapValidatorReport.create(brand: @brand)
      @brand.export_state.export_validator_report!(report.id)
      redirect_to :back, notice: 'Beginning to validate Route Maps and Export (this may take a while)...'
     else
      redirect_to :back, alert: "Brand is currently busy exporting #{@brand.export_state.curret_state.name} Currently In Progress! - try again later."
     end
   end

  member_action :reset_data_state do
    @brand = Brand.friendly.find(params[:id])
    @brand.data_state.reset!
    @brand.save
    redirect_to :back, notice: 'Data State reset'
  end

  member_action :reset_export_state do
    @brand = Brand.friendly.find(params[:id])
    @brand.export_state.reset!
    @brand.save
    redirect_to :back, notice: 'Export State reset'
  end

  action_item(:build_connections, only: :show)  do
    link_to('Build Brand Connections', build_connections_admin_brand_path(brand), class: 'btn btn-primary btn-med')
  end
  action_item(:build_smart_routes, only: :show) do
   link_to('Build Smart Routes', build_smart_routes_admin_brand_path(brand), class: 'btn btn-primary')
  end
  action_item(:build_route_maps, only: :show) do
   link_to('Build Route Maps', build_route_maps_admin_brand_path(brand), class: 'btn btn-primary btn-med')
  end
  action_item(:export_only, only: :show) do
     link_to('Export Route Map', export_only_route_maps_admin_brand_path(brand), class: 'btn btn-primary btn-med')
  end
  action_item(:full_export, only: :show) do
   link_to('Auto Export Route', full_export_route_maps_admin_brand_path(brand), class: 'btn btn-primary btn-med')
  end
  action_item(:validate, only: :show) do
     link_to('Validate', validate_route_map_admin_brand_path(brand), class: 'btn btn-primary btn-med')
  end






  controller do
      # def index
      #   @hosts = Host.all
      #   render :index,  layout: 'active_admin'
      # end
      def edit
        @brand = Brand.friendly.find(params[:id])
        render :edit,  layout: 'active_admin'
      end
      def show
        @brand = Brand.friendly.find(params[:id])
         render :show,  layout: 'active_admin'
       end

      def new
        @brand = Brand.new
        @brand.settings = BrandSetting.new
        render :new,  layout: 'active_admin'
      end

      # def update
      #   @brand = Brand.friendly.find(params[:id])
      #   @brand.update(permitted_params[:brand])
      #
      # end

     #  def create
     #       @brand = Brand.create(permitted_params[:brand])
     # end
  end

end
