module ApiRequest
  extend ActiveSupport::Concern

  def validate_form params
    Rails.logger.info params
    unless params[:report_key_id]
      params[:report_key_id] = ReportKey.current_key.id
      params[:report_key] =  ReportKey.current_key
    else
      params[:report_key] = ReportKey.find(params[:report_key_id])
    end
    @req = SearchRequest.new(params)
    Rails.logger.info @req.inspect
    @req
  end
  def validate_json params
     Rails.logger.info params
     unless params[:report_key_id]
       params[:report_key_id] = ReportKey.current_key.id
       params[:report_key] =  ReportKey.current_key
     else
       params[:report_key] = ReportKey.find(params[:report_key_id])
     end
     @req = SearchRequest.new(params)
     Rails.logger.info @req.inspect
     @req
  end

end
