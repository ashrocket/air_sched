Rails.application.config.assets.precompile += %w(emails.css)
Rails.application.config.assets.precompile += %w(emails.js)
#Rails.application.config.assets.precompile += %w(jquery/jquery.dataTables.fileSize.js)
#Rails.application.config.assets.precompile += %w(jquery/jquery.dataTables.datetime-us.js)
Rails.application.config.assets.precompile += ['destinations.js', 'destinations.css']
Rails.application.config.assets.precompile += ['search.js', 'search.css']

