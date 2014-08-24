module ApplicationHelper

  def controller_stylesheet_link_tag
    stylesheet = "#{params[:controller]}.css" #e.g. home_controller =>assets/stylesheets/home.css
    #if stylesheet asset exists include it
    unless Rails.application.assets.find_asset(stylesheet).nil?
      stylesheet_link_tag stylesheet
    end
  end
  def controller_javascript_include_tag
    javascript = "#{params[:controller]}.js" #e.g. home_controller =>assets/javascripts/home.js
    unless Rails.application.assets.find_asset(javascript).nil?
      javascript_include_tag javascript
    end
  end
  def title(page_title)
    content_for :title, page_title.to_s
  end


  def deep_link(flt, connection, ret_flt = nil, ret_connection = nil)
        host = "http://dev1.airblackbox.com/ibe3/voyages/search"
        qs   = { "origin" => flt.origin_apt,
                 "dest" => connection.dest_apt,
                 "leave" => flt.dep_date.strftime("%d-%b-%Y")
        }
        if ret_flt and ret_flt.dep_date
          qs.merge("return" => ret_flt.dep_date.strftime("%d-%b-%Y"),
                   "trip" => "round_trip")
        end
        return "#{host}?#{qs.to_param('voyage_search')}"

  end
end
