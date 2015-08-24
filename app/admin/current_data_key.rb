ActiveAdmin.register_page 'Current Data Key' do
  menu priority: 0,  :parent => 'Config'

  page_action :edit, method: :get do
  end
  page_action :set, method: :put do
    if AppControl.first.update(report_key_id: params[:app_control][:report_key_id])
      redirect_to  admin_current_data_key_path,
         notice: "Data key was successfully updated to #{ReportKey.find(params[:app_control][:report_key_id]).name}"
    else
      redirect_to  admin_current_data_key_path, alert: 'There was a problem setting the current dta key.'
    end
  end



  content :title => 'System Settings' do
    div do
      @app_control =  AppControl.first
      render partial: admin_current_data_key_edit_path, locals: {app_control: @app_control}
     end
  end


end


