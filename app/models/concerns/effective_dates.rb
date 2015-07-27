class EffectiveDates
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :eff, :disc

  def initialize(attributes = {})
    @eff = attributes[:eff]
    @disc = attributes[:disc]
  end

  def overlaps?(other)
    (@eff..@disc).overlaps(other.eff..other.disc)
  end

  def joined(other)
    if self.overlaps?(other)
      eff = max(@eff,other.eff)
      disc = min(@disc,other.disc)
      ed = EffectiveDates.new(eff: eff, disc: disc)
      ed
    else
      null
    end
  end

  def to_s
    strftime(eff)
  end


end