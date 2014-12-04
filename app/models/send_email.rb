class SendEmail
  
  attr_accessor :emails

  def self.process(emails, journey, one_way)
    if emails.present? && journey.is_a?(Hash)
      EmailItinerary.send_to_all(emails, journey, one_way).deliver
    end
  end



end
