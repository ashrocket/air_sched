module ActiveAdmin::AdminHelper
  def pretty_boolean(test)
      test ? content_tag(:span, 'Yes',class:'status_tag yes') : content_tag(:span, 'No',class:'status_tag no')
  end
end

