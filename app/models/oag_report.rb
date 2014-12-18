class OagReport < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Serialization/ClassMethods.html
  serialize :load_status, JSON

  scope :incomplete,  -> { where(complete: false) }

  def report_path
    load_status["report_path"]
  end
  def large_report?
    self.attachment_lines > 10000
  end
  def report_file_string
    unless self.report_path and File.exist? self.report_path
      if File.exist?(self.attachment_path)
        process_oag_file
      end
    end
    if self.report_path and File.exist? self.report_path
      return  File.readlines(self.report_path).join
    end
  end

  def estimated_key
      report_name = File.basename(self.report_path,File.extname(self.report_path))
      key_type    = report_name[0..2]

      if (['HUB','CXX', 'ABB'].include?(key_type))
        matches = report_name[3..-1].match /([A-Za-z0-9]+)_{0,1}/
        # matches = report_name[3..-1].match /[^A-Za-z]([A-Za-z0-9]+)_{0,1}/
        return  matches.captures.first.lstrip if matches
      end
      return nil
  end

  def process_attachment
    # TODO:  Check for Existing Report Key filename patterns and only process if Key Exists.

    Rails.logger.info "Decompressing Email Attachment for message #{self.msg_id} #{self.attachment_path}"

    ext = File.extname(self.attachment_path)

    if ext.eql? '.csv'
      if File.exists? self.attachment_path
        load_status["attachment_status"]  = 'uncompressed'
        load_status["report_path"]        = self.attachment_path
        load_status["report_size"]        = load_status["attachment_size"]
        save

      end
    elsif ext.eql? '.zip'
      if File.exist? self.attachment_path
        update(attachment_status: 'stored',attachment_size: File.stat(self.attachment_path).size)
      end
      Zip::InputStream::open(self.attachment_path) {|io|
         entry = io.get_next_entry
         uncompressed_filename   = entry.name.squish.gsub(" ", "_")
         uncompressed_path       = File.join( File.dirname(self.attachment_path), uncompressed_filename )
         File.open(uncompressed_path, 'wb'){|f| f << io.read}

         load_status["report_path"] = uncompressed_path
         load_status["report_size"] = File.stat(uncompressed_path).size
         load_status["attachment_status"]  = 'uncompressed'
         save

      }
    end
    save

  end

end
