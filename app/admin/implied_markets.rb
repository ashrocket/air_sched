ActiveAdmin.register ImpliedMarket  do
  menu priority: 0, label: 'Single Markets', :parent => 'Validators'
  actions :all, :except => [:new, :edit, :destroy]

   filter :brand
   filter :origin, filters: [:cont, :eq, :start, :end]
   filter :dest, filters: [:cont, :eq, :start, :end]



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
            mkt.dest
      end
      column '0 Stops' do |mkt|
        count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(1).count
        link_to count, admin_direct_flights_path("q[origin_eq]": mkt.origin,
                                                 "q[dest_eq]": mkt.dest)
      end
      column '1 Stops' do |mkt|
        count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(2).count
        link_to count, admin_branded_market_requests_path("q[brand_id_eq]": mkt.brand.id,
                                                          "q[origin_eq]": mkt.origin,
                                                          "q[dest_eq]": mkt.dest,
                                                          "q[seg_count_equals]":2)

      end
      column '2 Stops' do |mkt|
        count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(3).count
                link_to count, admin_branded_market_requests_path("q[brand_id_eq]": mkt.brand.id,
                                                                  "q[origin_eq]": mkt.origin,
                                                                  "q[dest_eq]": mkt.dest,
                                                                  "q[seg_count_equals]":3)
      end


  end


end
