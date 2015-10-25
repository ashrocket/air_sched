class BrandedRouteMapValidator < ActiveRecord::Base
  belongs_to :implied_market

  def rows
    tmp_rows = []
    self.route_map_structures.keys.sort.each do |k|
      self.route_map_structures[k].each do |solution|
        tmp_rows << [
            self.implied_market.origin,
            self.implied_market.dest,
            k,
            solution
        ].flatten
      end
    end
    tmp_rows
  end
end