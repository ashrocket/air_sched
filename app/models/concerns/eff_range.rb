class EffectiveRange
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :eff, :disc, :operating

  def initialize(attributes = {})
    @eff = attributes[:eff]
    @disc = attributes[:disc]
    @operating = attributes[:operating]
  end



end