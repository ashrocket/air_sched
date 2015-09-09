ActiveAdmin.register ReportKey do
  menu priority: 3,  :parent => 'Config'


  remove_filter :brand_report_keys, :oag_reports, :interline_cxr_rules, :slug, :state
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :report_key, :name, :comment, :file_pattern, :active, brand_ids: []
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do
       column :report_key
       column :name
       column :file_pattern
       column :comment
       column :brands do |report_key|
         content_tag :ul, class: 'list-group' do
           report_key.brands.collect{ |br|
             content_tag(:li, class: 'list-group-item') do
                link_to(br.name, admin_brand_path(br))
             end
           }.join.html_safe
         end
       end
       column :oag_reports do |report_key|
         content_tag :ul, class: 'list-group' do
           report_key.oag_reports.order('updated_at DESC').limit(2).collect{ |rpt|
             content_tag(:li, class: 'list-group-item') do
                link_to(admin_oag_report_path(rpt)) do
                  concat(content_tag(:div,rpt.current_state.name))
                  concat(content_tag(:div,rpt.updated_at))
                end
             end
           }.join.html_safe
         end
       end
       column :active

       actions
   end


  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  controller do
      # def index
      #   @hosts = Host.all
      #   render :index,  layout: 'active_admin'
      # end
      def edit
        @report_key = ReportKey.friendly.find(params[:id])
        render :edit,  layout: 'active_admin'
      end
      def show
        @report_key = ReportKey.friendly.find(params[:id])
         render :show,  layout: 'active_admin'
       end

      def new
        @report_key = ReportKey.new
        render :new,  layout: 'active_admin'
      end

      # def update
      #   @host = Host.find(params[:id])
      #   @host.update(permitted_params[:host])
      # end
  end

end
