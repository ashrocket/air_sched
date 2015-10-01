ActiveAdmin.register ImpliedMarket  do
  menu priority: 0, label: 'Single Markets', :parent => 'Validators'
  actions :all, :except => [:new, :edit, :destroy]

  # filter :report_key, filters: [:cont, :eq, :start, :end]
  # filter :workflow_state, filters: [:cont, :eq, :start, :end]
  # filter :complete
  # filter :created_at



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end



  index do

      column 'Brand' do |mkt|
        mkt.brand.name
      end
      column 'Origin' do |mkt|
            mkt.origin
      end
      column 'Destination' do |mkt|
            mkt.destination
      end


  end


end
