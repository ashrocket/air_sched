class Carrier < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: :slugged
  #t.string :code
  #t.string :name
  #t.boolean :active


  scope :active,  -> { where(active: true) }





end
