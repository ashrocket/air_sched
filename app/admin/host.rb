ActiveAdmin.register Host do
  menu :parent => "Codes"
  filter :name, filters: [:cont, :eq, :start, :end]
  filter :code, filters: [:cont, :eq, :start, :end]
  filter :airlines
  # filter :name

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :brand_id, :code, :name, airline_ids: []

  # action_item :clone, only: :show do
  #   link_to 'Clone', clone_admin_host_path(host) if (host and host.id)
  # end
  # action :clone, only: :index do
  #   byebug
  #   link_to 'Clone', clone_admin_host_path(host) if (host and host.id)
  # end


  index do
    column :brand
    column :code
    column :name
    column :airlines  do |host|
      content_tag :ul, class: 'list-group' do
        host.airlines.collect{ |al|
          content_tag :li, class: 'list-group-item' do
            content_tag :a do
              link_to("#{al.code} - #{al.name}", [:admin,al])
            end
          end
        }.join.html_safe
      end
    end

    actions do |host|
        link_to "Clone", clone_admin_host_path(host), class: "member_link"
    end
  end



  member_action :clone, method: [:get] do
      @o_host = Host.find(params[:id])
      @host = @o_host.dup
      @o_host.airlines.each do |airline|
        @host.airlines << airline
      end

      render :edit
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