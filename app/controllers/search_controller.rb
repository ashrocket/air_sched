class SearchController < ApplicationController
  include ApiRequest
  include ApiResponse


  respond_to :html, :xml, :json

  def index
    req = params.except(:controller, :action, :format)
    @search_request  = validate_form req
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
            @search_results   = OagSchedule.search_interlines @search_request
            @status = :ok
          else
            render action: :index
          end

        }
    end

  end

end
