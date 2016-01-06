ActiveAdmin.register ImpliedMarket  do
  menu priority: 0, label: 'Implied Markets', :parent => 'Validators'
  actions :all, :except => [:new, :edit, :destroy]

   filter :brand
   filter :origin, filters: [:cont, :eq, :start, :end]
   filter :dest, filters: [:cont, :eq, :start, :end]
   filter :branded_route_map_validator_route_map_counts_cont, label: 'Counts'


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


      column :brand do |mkt|
          content_tag :ul, class: 'list-group' do
            content_tag(:li, class: 'list-group-item') do
               link_to(mkt.brand.name, admin_brand_path(mkt.brand))
            end
          end
      end
      column 'Origin' do |mkt|
            mkt.origin
      end
      column 'Destination' do |mkt|
            mkt.dest
      end
      column 'Details' do |mkt|
        link_to '?', admin_branded_route_map_validator_path(mkt.branded_route_map_validator.id) if mkt.branded_route_map_validator
      end
      column '0 Stops' do |mkt|
        if mkt.branded_route_map_validator
          count = mkt.branded_route_map_validator.route_map_counts['1']
        else
          count = 0
        end
        # count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(1).count
        link_to count, admin_direct_flights_path("q[origin_eq]": mkt.origin,
                                                 "q[dest_eq]": mkt.dest)
      end
      column '1 Stops' do |mkt|
        if mkt.branded_route_map_validator
          count = mkt.branded_route_map_validator.route_map_counts['2']
        else
          count = 0
        end

        # count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(2).count
        link_to count, admin_branded_market_requests_path("q[brand_id_eq]": mkt.brand.id,
                                                          "q[origin_eq]": mkt.origin,
                                                          "q[dest_eq]": mkt.dest,
                                                          "q[seg_count_equals]":2)

      end
      column '2 Stops' do |mkt|
        if mkt.branded_route_map_validator
          count = mkt.branded_route_map_validator.route_map_counts['3']
        else
          count = 0
        end
        # count = BrandedMarketRequest.branded(mkt.brand).market(mkt.origin, mkt.dest).segments(3).count
        link_to count, admin_branded_market_requests_path("q[brand_id_eq]": mkt.brand.id,
                                                                  "q[origin_eq]": mkt.origin,
                                                                  "q[dest_eq]": mkt.dest,
                                                                  "q[seg_count_equals]":3)
      end


  end

  controller do

    def scoped_collection
       super.includes :branded_route_map_validator, :brand # prevents N+1 queries to your database
    end
    def find_resource
      ImpliedMarket.where(id: params[:id]).first! # overrides resource retrieval to prevent eager loading
    end

  end
end
