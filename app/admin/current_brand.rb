ActiveAdmin.register_page 'Current Brand' do
  menu priority: 0,  :parent => 'Config'

  page_action :edit, method: :get do
  end
  page_action :set, method: :put do
    if AppControl.first.update(brand_id: params[:app_control][:brand_id])
      redirect_to  admin_current_brand_path,
         notice: "Brand was successfully updated to #{Brand.find(params[:app_control][:brand_id]).name}"
    else
      redirect_to  admin_current_brand_path, alert: 'There was a problem setting the current dta key.'
    end
  end



  content :title => 'System Settings' do
    div do
      @app_control =  AppControl.first
      render partial: admin_current_brand_edit_path, locals: {app_control: @app_control}
     end
  end


end


