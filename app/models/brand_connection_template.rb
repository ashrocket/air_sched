class BrandConnectionTemplate < ActiveRecord::Base



  scope :keyed,     lambda {|brand_key| where("brand_key = ?",  brand_key)}
  scope :market,    lambda {|o,d|    where(:origin =>  o, :dest => d)}


  def market
    origin + dest
  end

  def eff_window_key
     "#{eff} - #{disc} #{operating_window.join(',')}"
  end
  def path_key
    "#{origin}-#{via}-#{dest}"
  end
   def key
     "#{path_key}-#{sched1_cxr},#{sched2_cxr}"
   end
   def full_key
     [key, eff_window_key].join('...')
   end

end