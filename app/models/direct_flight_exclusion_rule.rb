class DirectFlightExclusionRule < ActiveRecord::Base
  belongs_to :report_key

  #   direct_pairs = DirectFlight.keyed(report.report_key).pluck(:origin, :dest, :carriers)
  #         direct_pairs.sort!
  #         direct_pairs_hash = direct_pairs.group_by{|pair| pair[0]}
  # Rails.logger.info "Unique Connection Pairs not filtered for Direct Flight Exclusion rule #{cnx.count} #{report.report_key.code}"
  # cnx.delete_if{|row| direct_pairs_hash[row[0]].include? [row[0],row[2]] }
  # Rails.logger.info "Unique Connection Pairs after filtered for Direct Flight Exclusion rule #{cnx.count} #{report.report_key.code}"

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
