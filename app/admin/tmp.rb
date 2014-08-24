#ActiveAdmin.register ABBConfig do
#
#
#  # See permitted parameters documentation:
#  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#  #
#  permit_params :var, :value, :tip
#  #
#  # or
#  #
#  # permit_params do
#  #  permitted = [:permitted, :attributes]
#  #  permitted << :other if resource.something?
#  #  permitted
#  # end
#   # /admin/posts/:id/comments
#  index do
#    selectable_column
#    column :var
#    column :value
#    column :tip
#  end
#  form do |f|
#     f.inputs "Setting Details" do
#       f.input :var
#       f.input :value
#       f.input :tip
#     end
#     f.buttons
#  end
#  #collection_action :import_csv, :method => :post do
#  #      # Do some CSV importing work here...
#  #      redirect_to {:action => :index}, {:notice => "CSV imported successfully!"}
#  #end
#  #
#  #member_action :abb_config do
#  #  @post = Post.find(params[:id])
#  #
#  #  # This will render app/views/admin/posts/comments.html.erb
#  #end
#
#  #def index
#  #   # to get all items for render list
#  #   @abb_configs = ABBConfig.unscoped
#  # end
#
#   #def edit
#   #  @abb_config = ABBConfig.unscoped.find(params[:id])
#   #end
#
#   #def update
#   #
#   #  @abb_config = ABBConfig.unscoped.find(params[:id])
#   #  @abb_config.var = params[:abb_config][:var]
#   #  @abb_config.value = params[:abb_config][:value]
#   #  @abb_config.tip = params[:abb_config][:tip] if params[:abb_config][:tip]
#   #
#   #  respond_to do |format|
#   #    format.json{
#   #      if @abb_config.save
#   #        render json: @abb_config, status: :accepted, location: edit_tuning_abb_config_path(@abb_config)
#   #
#   #      else
#   #        render json: @abb_config.errors, status: :unprocessable_entity
#   #      end
#   #    }
#   #    format.html{
#   #      if @abb_config.save
#   #        redirect_to tuning_abb_config_index_path, notice: "Saved."
#   #      else
#   #        render "edit"
#   #      end
#   #    }
#   #  end
#
#
#end
