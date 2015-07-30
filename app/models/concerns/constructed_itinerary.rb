class ConstructedItinerary
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :origin, :dest, :pricing_requests, :eff_window, :operating_window

  def initialize(attributes = {})
    @origin             = attributes[:origin]
    @dest               = attributes[:dest]
    @pricing_requests   = attributes[:pricing_requests]
    @eff_window         = @pricing_requests.first.eff_window
    @operating_window   = @pricing_requests.first.operating_window

  end
  #
  # def inspect
  #   key
  # end

end