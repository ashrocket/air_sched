class SendEmailsController < ApplicationController

  respond_to :json

  def create
    SendEmail.process(params['emails'], params['journey'], params['one_way'])
  end

end
