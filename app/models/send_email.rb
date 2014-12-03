class SendEmail
  
  attr_accessor :emails

  def self.process(emails, journey)
    if emails.present? && journey.is_a?(Hash)
      EmailItinerary.send_to_all(emails, journey).deliver
    end
  end



end
