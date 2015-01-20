JsRoutes.setup do |config|
    config.default_url_options ={:format => "json",
                                 :trailing_slash => true,
                                 :protocol => "http",
                                 :host => AirSched::Application.config.application_url,
                                 :port => AirSched::Application.config.application_port}

end