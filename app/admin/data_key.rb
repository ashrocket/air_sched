ActiveAdmin.register_page "Data Key" do
  menu :parent => "Config"


  content :title => 'System Settings' do
    div do
      render 'data_key'
     end
  end


end