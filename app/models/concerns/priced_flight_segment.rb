class PricedFlightSegment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  # extend Forwardable




  attr_accessor :flight_segment, :price, :fare

  def initialize(flight_segment, price = 0.0, fare = nil)
     @flight_segment  = flight_segment
     @price   = price
     @fare = fare
  end

  # TODO: FOr now this is fine, but it's not perform, refactor and use def_delegators, or have all the classes use the flight attribute
  def method_missing(method, *args)
      return flight_segment.send(method, *args) if flight_segment  && flight_segment.respond_to?(method)
      super
  end

end