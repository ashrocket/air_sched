module Admin
class MarketDataExportsController < ApplicationController

  def tasks
   render :default
  end
  def generate
      ExportMarketDataWorker.perform_async
      respond_to do |format|
        format.html{
           redirect_to admin_market_exports_path
        }
        format.json{
          #Not Implemented Yet
        }
      end
  end


end
end