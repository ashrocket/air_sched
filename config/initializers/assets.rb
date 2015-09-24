Rails.application.config.assets.precompile += %w(emails.css)
Rails.application.config.assets.precompile += %w(emails.js)
#Rails.application.config.assets.precompile += %w(jquery/jquery.dataTables.fileSize.js)
#Rails.application.config.assets.precompile += %w(jquery/jquery.dataTables.datetime-us.js)
%w( search destinations direct_flights ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end

# These are assets to pre-compile for fallback CDN failures
Rails.application.config.assets.precompile += %w( jquery/dist/jquery.js )
Rails.application.config.assets.precompile += %w( jquery-ui/jquery-ui.js )
Rails.application.config.assets.precompile += %w( jquery-ui/jquery-ui.js )
Rails.application.config.assets.precompile += %w( font-awesome/scss/font-awesome.scss )
# Rails.application.config.assets.precompile += %w( jquery-ui/ui/core.js jquery-ui/ui/progressbar.js jquery-ui/ui/widget.js)
# Branded Assets

Rails.application.config.assets.precompile += ['fr/fr.css']
%w( fr/application fr/search fr/destinations fr/direct_flights ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end

