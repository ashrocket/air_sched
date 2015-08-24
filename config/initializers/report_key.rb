# if ActiveRecord::Base.connection.tables.include?('report_keys') and !defined?(::Rake)
#
#
#   current_data_key = ReportKey.current_report
#    unless current_data_key
#      report_key = ReportKey.first
#      unless report_key.report_key.count > 0
#         first_key = active_report_keys.first
#         ReportKey.current_key = first_key.key
#      else
#        ReportKey.current_key = 'NONE'
#
#      end
#    end
#
#
# end
