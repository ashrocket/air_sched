module ApiResponse
  extend ActiveSupport::Concern

  def prepare_json results, search_request
      Rails.logger.info params

      @result = SearchResponse.new(results)
      Rails.logger.info @result
      @result.join_results if search_request.join.eql? true
      @result


  end



end