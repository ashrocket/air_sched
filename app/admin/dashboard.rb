ActiveAdmin.register_page "Dashboard" do

  menu priority: 0, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div do
      @app_control =  AppControl.first
      render partial: admin_current_brand_edit_path, locals: {app_control: @app_control}
      render partial: admin_current_report_key_edit_path, locals: {app_control: @app_control}
      render 'admin/export/tasks'
    end

  end # content
end
