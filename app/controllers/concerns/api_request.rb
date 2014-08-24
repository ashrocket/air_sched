module ApiRequest
  extend ActiveSupport::Concern

  def validate_form params
    Rails.logger.info params
    unless params[:data_key]
           params[:data_key] =  ABBConfig.data_key
    end
    @req = SearchRequest.new(params)
    Rails.logger.info @req
    @req
  end
  def validate_json params
     Rails.logger.info params
     unless params[:data_key]
           params[:data_key] =  ABBConfig.data_key
     end
     @req = SearchRequest.new(params)
     Rails.logger.info @req
     @req
  end

end
