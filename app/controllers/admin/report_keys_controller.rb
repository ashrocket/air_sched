module Admin
class ReportKeys < ApplicationController
  def set_current
    @abb_config = ABBConfig.unscoped.find(params[:id])
  end


end
end