class OagReport < ActiveRecord::Base
  serialize :load_status, JSON


  def report_path
    load_status["report_path"]
  end

  def report_file_string
    unless report_path and File.exist? report_path
      if File.exist?(attachment_path)
        Oag::Process.process_oag_file(self)
      end
    end
    if report_path and File.exist? report_path
      return  File.readlines(report_path).join
    end
  end

  def estimated_key
      report_name = File.basename report_path
      key_type    = report_name[0..2]

      if key_type.eql? 'HUB'
        matches = report_name[3..-1].match /[^a-zA-Z0-9]?([A-z]{3})/
      else
        matches = report_name[3..-1].match /[^a-zA-Z0-9]?([A-z]{2})/
      end
      return  matches.captures.first
    end

end
