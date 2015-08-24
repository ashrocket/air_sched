ActiveAdmin.register Airline do
  menu :parent => "Codes"
  filter :hosts, filters: [:cont, :eq, :start, :end]
  filter :code, filters: [:cont, :eq, :start, :end]
  filter :name, filters: [:cont, :eq, :start, :end]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :code, :name, :country_name, :slug, host_ids: []


  index do
      column :code
      column :name
      column :country_name
      column :hosts  do |airline|
        content_tag :ul, class: 'list-group' do
          airline.hosts.collect do |h|
            content_tag(:li, "#{h.code} - #{h.name}", class: 'list-group-item')
          end
        end
      end

      actions
  end


  controller do
    def edit
      @airline = Airline.find(params[:id])
      render :edit,  layout: 'active_admin'
    end

    def show
       @airline = Airline.find(params[:id])
       render :show,  layout: 'active_admin'
     end

    def new
      @airline = Airline.new
      render :new,  layout: 'active_admin'
    end

  end



  active_admin_import validate: false,
                      resource_label: 'Airlines',
                      :csv_options => {:col_sep => "," },
                      :before_import => proc{ Airline.delete_all},
                      :batch_size => 1000





end
