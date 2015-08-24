class BrandReportKey < ActiveRecord::Base
  belongs_to :brand
  belongs_to :report_key
end
