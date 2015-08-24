ActiveAdmin.register Host do
  menu :parent => "Codes"
  filter :name, filters: [:cont, :eq, :start, :end]
  filter :code, filters: [:cont, :eq, :start, :end]
  filter :airlines
  # filter :name

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :code, :name, airline_ids: []

  index do
    column :code
    column :name
    column :airlines  do |host|
      content_tag :ul, class: 'list-group' do
        host.airlines.collect{ |al|
          content_tag(:li, "#{al.code} - #{al.name}", class: 'list-group-item')
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
      @host = Host.find(params[:id])
      render :edit,  layout: 'active_admin'
    end
    def show
       @host = Host.find(params[:id])
       render :show,  layout: 'active_admin'
     end

    def new
      @host = Host.new
      render :new,  layout: 'active_admin'
    end

    # def update
    #   @host = Host.find(params[:id])
    #   @host.update(permitted_params[:host])
    # end
  end
end