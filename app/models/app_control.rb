class AppControl < ActiveRecord::Base
  belongs_to :report_key, class_name:'ReportKey'
  belongs_to :brand

  def self.singleton
    return self.all.first if self.all.first
    only_one = self.create(brand: Brand.first, )
    only_one
  end

  # Alias
  def self.first
    self.singleton
  end


  def self.first_time_setup
    brand = Brand.first_or_create!
    rk = ReportKey.where(name: 'Null Report', report_key: 'NONE').first_or_create
    ReportKey.set_current(rk)

    ac = AppControl.first_or_create!
    ac.report_key = rk unless ac.report_key
    ac.brand = brand unless ac.brand
    ac.save
  end
end
