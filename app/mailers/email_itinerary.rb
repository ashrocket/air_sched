class EmailItinerary < ActionMailer::Base

	layout 'email'
	default from: ''

	def session
		'nil'
	end

	def send_to_all(emails, journey, one_way)
		@journey = journey
		@one_way = one_way
	    subject = "Sample Itinerary"
	    from = "shannon@airblackbox.com"
	    to = emails.split(',')

	    mail to: to, subject: subject, from: from
	end

end
