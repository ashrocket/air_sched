class ResultSet
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :hub, :journeys, :errors

  def initialize(attributes = {})
        @hub        = attributes[:hub]
        @errors     = attributes[:errors]
        @journeys = []
        journey = attributes[:journeys].is_a?(Hash) ? attributes[:journeys]   : []
        @journeys = Journey.new(journey)
  end
end