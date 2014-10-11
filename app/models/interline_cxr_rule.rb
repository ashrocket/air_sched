class InterlineCxrRule < ActiveRecord::Base
  belongs_to :report_key

  class << self
     def keyed(report_key)
       report_key_obj =  ReportKey.find_by(report_key: report_key)
       where('report_key_id = ?',  report_key_obj.id).order(:sequence)
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
