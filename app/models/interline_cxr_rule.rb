class InterlineCxrRule < ActiveRecord::Base
  belongs_to :report_key

  class << self
     def keyed(report_key)
       report_key_obj =  ReportKey.find_by(report_key: report_key)
       if report_key_obj
        where(report_key: report_key_obj).order(:sequence)
       else
         []
       end
     end
  end


  def apply(targets)
    case rule_kind
      when 'whitelist'
        whitelisted = targets.select{ |target|
          apply? target
        }
        whitelisted
      else
        targets
    end
  end

  def apply?(target)
    matched = patterns.map{ |pattern|
      target.send(match_on) =~ /#{pattern}/
    }.compact
    not matched.blank?
  end
end
