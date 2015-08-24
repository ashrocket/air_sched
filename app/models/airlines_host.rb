class AirlinesHost < ActiveRecord::Base
  belongs_to :airline, -> { order(code: :asc) }
  belongs_to :host
end
