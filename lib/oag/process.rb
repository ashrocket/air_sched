require 'thread'

module Oag
  module Process
  extend self


    #def job_from_filename(job_type, filename)
    #   test_string = filename.upcase
    #   matches = test_string.match(/#{job_type}[^a-zA-Z0-9]?([a-zA-Z0-9]+)/)
    #   key = matches.blank? ? nil : matches.captures.first
    #   ext = File.extname(filename)
    #   case ext
    #   when /\.zip/
    #     {job: job_type, key: key, archive: filename}
    #   else
    #     {job: job_type, key: key, tmpfile: filename }
    #   end
    #end
    #def process_attachment msg_id
    #case job[:job]
    #  when /HUB/
    #    process_hub job
    #  when /CXX/
    #    process_cxx job
    #end
    #end
    #def process_job job
    #  case job[:job]
    #    when /HUB/
    #      process_hub job
    #    when /CXX/
    #      process_cxx job
    #  end
    #end

    def process_oag_file report
      ext = File.extname(report.filepath)

      if ext.eql? '.zip'
        Zip::InputStream::open(report.filepath) {|io|
           entry = io.get_next_entry
           uncompressed_filename   = entry.name.squish.gsub(" ", "_")
           uncompressed_path       = File.join( File.dirname(report.filepath), uncompressed_filename )
           File.open(uncompressed_path, 'wb'){|f| f << io.read}
           File.delete(report.filepath)
           report.uncompressed = File.stat(uncompressed_path).size
           report.filepath     = uncompressed_path
           report.save
        }

      end
    end

  #
  #  def process_hub job
  #      if job[:tmpfile].blank?
  #        job[:tmpfile] = job[:archive][0..-5]
  #        ext = File.extname(job[:tmpfile])
  #        unless ext.eql? '.csv'
  #          job[:tmpfile] = "#{job[:tmpfile]}.csv"
  #        end
  #
  #        unless File.exists? job[:tmpfile]
  #          Oag::Util.uncompress_report(job[:archive], job[:tmpfile])
  #        end
  #      end
  #
  #
  #      csv_string = File.readlines(job[:tmpfile]).join
  #      begin
  #         Oag::Import.parse_hub job[:key], csv_string
  #      rescue Exception => ex
  #             Rails.logger.info ex.message
  #             Rails.logger.info job
  #      end
  #      Airport.refresh_from_hub job[:key]
  #
  #
  #      DirectFlight.load_by_hub(job[:key])
  #      Destination.load_by_hub(job[:key])
  #      CnxPair.load_by_hub(job[:key])
  #      apt = Airport.find_by(code: job[:key])
  #      hub = Hub.where(code: job[:key]).first_or_create
  #      hub.name = apt.name
  #      hub.active = true
  #      hub.save
  #      if job[:archive].blank?
  #        job[:archive] = "#{job[:tmpfile]}.zip"
  #        unless File.exists? job[:archive]
  #          Oag::Util.compress_report(job[:archive], job[:tmpfile])
  #        end
  #      end
  #      FileUtils.mv job[:archive], File.join("data","oag","processed", "." )
  #      File.delete job[:tmpfile]
  #
  #  end
  #
  #  def process_cxx job
  #      if job[:tmpfile].blank?
  #        job[:tmpfile] = job[:archive][0..-5]
  #        ext = File.extname(job[:tmpfile])
  #        unless ext.eql? '.csv'
  #          job[:tmpfile] = "#{job[:tmpfile]}.csv"
  #        end
  #
  #        unless File.exists? job[:tmpfile]
  #          Oag::Util.uncompress_report(job[:archive], job[:tmpfile])
  #        end
  #      end
  #      linecount = %x{wc -l < "#{job[:tmpfile]}"}.to_i
  #      if linecount < 100000
  #        csv_string = File.readlines(job[:tmpfile]).join
  #        begin
  #           Oag::Import.parse_cxx job[:key], csv_string
  #        rescue Exception => ex
  #               Rails.logger.info ex.message
  #               Rails.logger.info job
  #        end
  #      else
  #        begin
  #          Oag::Import.parse_large_cxx job[:key], job[:tmpfile]
  #        rescue Exception => ex
  #               Rails.logger.info ex.message
  #               Rails.logger.info job
  #        end
  #      end
  #
  #      Airport.refresh_from_cxx job[:key]
  #
  #      DirectFlight.load(job[:key])
  #
  #      Destination.load(job[:key])
  #
  #      CnxPair.load(job[:key])
  #
  #      cxr = Airline.find_by(code: job[:key])
  #      cxx = Carrier.find_or_create_by(code: job[:key])
  #
  #      cxx.name    = cxr.name
  #      cxx.country = cxr.country
  #      cxx.active = true
  #      cxx.save
  #      if job[:archive].blank?
  #        job[:archive] = "#{job[:tmpfile]}.zip"
  #        unless File.exists? job[:archive]
  #          Oag::Util.compress_report(job[:archive], job[:tmpfile])
  #        end
  #      end
  #      FileUtils.mv job[:archive], File.join("data","oag","processed", "." )
  #      File.delete job[:tmpfile]
  #  end
  #
  #
  #  def handle job
  #      case job[:job]
  #      when "REJ"
  #        File.delete job[:archive]
  #        File.delete job[:tmpfile]
  #      when "HUB"
  #        process_hub job
  #
  #      when "CXX"
  #        process_cxx job
  #
  #      end
  #      #url = S3Uploader.save task_details[:archive]
  #      #OAGReport.first_or_create!(:url => url,
  #      #                           :filename => report.filename,
  #      #                           :datecode => message.date.strftime("%Y%m%d"),
  #      #                           :report_type => report_type)
  #
  #  end
  #
  #
  #
  end
end
