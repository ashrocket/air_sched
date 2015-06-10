ActiveAdmin.register_page 'Active Data Key' do
  menu priority: 0,  :parent => 'Config'


  content :title => 'System Settings' do
    div do
      render :partial => 'admin/data_key/data_key'
      # render 'data_key'
     end
  end


end