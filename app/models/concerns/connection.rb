class Connection
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :leg_1, :leg_2, :connect_time

  def initialize(attributes = {})
    @leg_1     = attributes[:leg_1]
    @leg_2     = attributes[:leg_2]
    @connect_time    = @leg_1.connection_time @leg_2
  end

end