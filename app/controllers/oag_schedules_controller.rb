class OagSchedulesController < ApplicationController

  def mkt
    is_int = Integer(params[:origin]) rescue nil
    if is_int
      o = Airport.find(params[:origin]).code
      d = Airport.find(params[:dest]).code
    else
      o = params[:origin].upcase
      d = params[:dest].upcase
    end
    @oag_schedules = OagSchedule.market(o,d)

  end
  def to_hub
    origin = params[:origin]
    if origin.eql?  ABBConfig.hub.upcase
      @oag_schedules = OagSchedule.none
    else
      @oag_schedules = OagSchedule.hub(ABBConfig.hub.upcase).departing(origin.upcase)
    end

    render :mkt
  end
  def from_hub
    dest = params[:dest]
    # Sanity check
    if dest.eql?  ABBConfig.hub.upcase
      OagSchedule.none
      @oag_schedules = OagSchedule.none
    else
      @oag_schedules = OagSchedule.hub(ABBConfig.hub.upcase).arriving(dest.upcase)
    end
    render :mkt

  end


end