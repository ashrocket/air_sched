ActiveAdmin.register AppControl do
  menu priority: 3,  :parent => 'Config'
  actions :all, except: [:index, :new, :show, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :report_key

end