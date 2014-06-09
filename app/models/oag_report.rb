class OagReport < ActiveRecord::Base
  serialize :load_status, JSON

  scope :incomplete,  -> { where(complete: false) }

  def report_path
    load_status["report_path"]
  end

  def report_file_string
    unless report_path and File.exist? report_path
      if File.exist?(attachment_path)
        process_oag_file(self)
      end
    end
    if report_path and File.exist? report_path
      return  File.readlines(report_path).join
    end
  end

  def estimated_key
      report_name = File.basename report_path
      key_type    = report_name[0..2]

      if (['HUB','CXX', 'ABB'].include?(key_type))
        matches = report_name[3..-1].match /[^A-Za-z](.*)_/
        return  matches.captures.first
      end
      return nil
  end

  def process_oag_file
    Rails.logger.info "Decompressing Email Attachment for message #{msg_id} #{attachment_path}"
    if File.exist? attachment_path
      update(attachment_status: 'stored',attachment_size: File.stat(attachment_path).size)
    end

    ext = File.extname(attachment_path)

    if ext.eql? '.csv'
      if File.exists? attachment_path
        load_status["attachment_status"]  = 'uncompressed'
        load_status["report_path"]        = attachment_path
        load_status["report_size"]        = load_status["attachment_size"]
        save

      end
    elsif ext.eql? '.zip'
      Zip::InputStream::open(attachment_path) {|io|
         entry = io.get_next_entry
         uncompressed_filename   = entry.name.squish.gsub(" ", "_")
         uncompressed_path       = File.join( File.dirname(attachment_path), uncompressed_filename )
         File.open(uncompressed_path, 'wb'){|f| f << io.read}

         load_status["report_path"] = uncompressed_path
         load_status["report_size"] = File.stat(uncompressed_path).size
         save

      }
    end
    self.report_key  = estimated_key
    unless self.report_key
      report_status ='rejected'
      attachment_status = 'rejected'
      File.delete attachment_path if File.exist? attachment_path
      File.delete report_path if File.exist? report_path
      report.complete = true
    end
    save

  end

end
