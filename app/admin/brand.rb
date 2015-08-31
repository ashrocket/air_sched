ActiveAdmin.register Brand, as: 'Brands' do
  menu priority: 2,  :parent => 'Config'


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :brand_key, :report_keys, :name,  :description, :default_currency, :active, report_key_ids: [], host_ids: []
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
                link_to(rk.name, admin_data_key_path(rk))
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

       actions
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
