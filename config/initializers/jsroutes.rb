JsRoutes.setup do |config|
    config.default_url_options ={
                                 :protocol => "http",
                                 :host => AirSched::Application.config.application_url,
                                 :port => AirSched::Application.config.application_port}
    config.url_links = true

end