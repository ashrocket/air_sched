class EmailItinerary < ActionMailer::Base

	layout 'email'
	default from: ''

	def session
		'nil'
	end

	def send_to_all(emails, journey)
		@journey = journey
	    subject = "Sample Itinerary"
	    from = "Shannon Airport"
	    to = emails.split(',')

	    mail to: to, subject: subject, from: from
	end

end
