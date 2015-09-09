ActiveAdmin.register Brand, as: 'Brands' do
  menu priority: 2,  :parent => 'Config'


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :brand_key, :report_keys, :name,  :description,
                :default_currency, :max_segments,  :active, report_key_ids: [], host_ids: []
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
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
       column :default_currency
       column :max_segments

       actions
  end

  member_action :build_connections do
   @brand = Brand.friendly.find(params[:id])
   unless @brand.processing_connections?

     UpdateBrandConnectionsWorker.perform_async(@brand.brand_key)
     redirect_to :back, notice: 'Beginning to build Branded Connections ...'
   else
     redirect_to :back, alert: 'Already building Branded Connections! - In Progress'
   end
  end

  member_action :build_smart_routes do
    @brand = Brand.friendly.find(params[:id])
    unless @brand.processing_smart_routes?

      UpdateSmartRoutesWorker.perform_async(@brand.brand_key)
      redirect_to :back, notice: 'Beginning to build Smart Routes ...'
    else
      redirect_to :back, alert: 'Already building Smart Routes! - In Progress'
    end
  end

  member_action :build_route_maps do
    @brand = Brand.friendly.find(params[:id])
    unless @brand.processing_route_maps?

      UpdateRouteMapsWorker.perform_async(@brand.brand_key)
      redirect_to :back, notice: 'Beginning to build Route Maps ...'
    else
      redirect_to :back, alert: 'Already building Route Maps! - In Progress'
    end
  end
  member_action :full_export_route_maps do
    @brand = Brand.friendly.find(params[:id])
    unless @brand.processing_route_map_export?
      report = ExportSmartRouteReport.create(brand: @brand)
      ExportBrandRouteMapsWorker.perform_async(@brand.brand_key, report.id)
      redirect_to :back, notice: 'Beginning to build Full Route Maps and Export (this may take a while)...'
    else
      redirect_to :back, alert: 'In Progress! - Already building build Full Route Maps and Export (this may take a while)'
    end
  end
  # TODO: Move this into a seperate sidekiq worker
  member_action :export_only_route_maps do
     @brand = Brand.friendly.find(params[:id])
     unless @brand.processing_route_map_export?
       report = ExportSmartRouteReport.create(brand: @brand)
       report.finalize!
       redirect_to :back, notice: 'Beginning to Export route map...'
     else
       redirect_to :back, alert: 'In Progress! - Already exporting route map (this may take a while)'
     end
   end
  member_action :reset_data_states do
    @brand = Brand.friendly.find(params[:id])
    @brand.data_states = {}
    @brand.save
    redirect_to :back, notice: 'Data States reset'

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
  action_item(:reset_data_states, only: :show) do
     link_to('Reset DataState', reset_data_states_admin_brand_path(brand), class: 'btn btn-primary btn-med')
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
        render :new,  layout: 'active_admin'
      end

      # def update
      #   @brand = Brand.friendly.find(params[:id])
      #   @brand.update(permitted_params[:brand])
      # end

     #  def create
     #       byebug
     #       @brand = Brand.create(permitted_params[:brand])
     # end
  end

end
