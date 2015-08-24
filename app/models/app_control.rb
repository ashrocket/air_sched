class AppControl < ActiveRecord::Base
  belongs_to :report_key, class_name:'ReportKey'
end
