module Admin
class ReportKeys < ApplicationController
  # def set_current
  #   @abb_config = ABBConfig.unscoped.find(params[:id])
  # end
  def index
   @report_keys = ReportKey.order(:name)
  end


end
end