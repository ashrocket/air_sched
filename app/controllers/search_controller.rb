class SearchController < ApplicationController
  include ApiRequest
  include ApiResponse
  before_action :set_brand_layout
  layout :select_layout
  before_filter :set_branded_viewpath

  respond_to :html, :xml, :json

  def index

    req = params.except(:controller, :action, :format)
    @search_request  = validate_form req

    # unless Destination.origins.count > 0
    #   raise("No Valid Schedules for #{ReportKey.current_key}")
    # end

  end

  def search
      respond_to do |format|
        format.json {
          req = params["search"]
          @search_request = validate_json req
          results   = OagSchedule.search_interlines @search_request
          @search_results  = prepare_json results, @search_request

        }
        format.html{
          @search_request  = validate_form params["search_request"]
          if @search_request.valid?

            shop_service = ShoppingService.new
            @search_results = shop_service.shop(@search_request)
            @status = :ok
          else
            render action: :index
          end

        }
    end

  end
  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_search
    #   @search = Host.find(params[:id])
    # end
    #
    # # Only allow a trusted parameter "white list" through.
    # def search_params
    #   params.require(:search).permit(:name, :code, airline_ids: [])
    # end

end
