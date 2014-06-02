class Journey
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :errors, :f, :x, :xmap, :mct_invalid

  def initialize(attributes = {})
    @errors = attributes[:errors]
    @xmap = {}
    @mct_invalid = {}

    flights     = attributes[:f].is_a?(Array) ? attributes[:f] : []
    connections = attributes[:x].is_a?(Array) ? attributes[:x] : []
    xmap =  attributes[:xmap].is_a?(Hash) ? attributes[:xmap] : []
    mct_invalid =  attributes[:mct_invalid].is_a?(Hash) ? attributes[:mct_invalid] : []
    @f = flights.map{|flight| flight}
    @x  = connections.map{|connection|  connection}
    xmap.each{|k,v| @xmap[k] = v }
    mct_invalid.each{|k,v| @mct_invalid[k] = v }

  end

end