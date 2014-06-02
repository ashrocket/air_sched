class JoinedJourney
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :f, :cnx, :hub

  def initialize(attributes = {})
    @f = attributes[:f]
    @cnx = attributes[:cnx]
    @hub = attributes[:hub]
  end

end