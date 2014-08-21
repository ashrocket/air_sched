class AppSwitch < ActiveRecord::Base

  class << self
    def on?(switch_name)
      switch = find_by(name: switch_name)
      switch and switch.enabled
    end
  end

  def wax_on
    self.enabled = true
    self.save
  end

  def wax_off
    self.enabled = false
    self.save
  end

end
