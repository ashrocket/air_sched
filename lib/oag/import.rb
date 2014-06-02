#require 'csv'
#require 'parallel'
#
#module Oag
#  module Import
#  extend self
#
#  def body_converters
#         return lambda{|s, details|
#            begin
#              if [:localarrtime,:localdeptime].include? details.header
#                "%04d" % s.to_i
#              else
#                s
#              end
#            rescue Exception  => ex
#              Rails.logger.info ex.message
#              s
#            end
#          }
#
#    end
#
#  def parse_hub hub, csv_string
#      # Read remaining rows as CSV file
#       CSV::Converters[:oag_converters]  = body_converters
#       options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
#       data_rows = []
#       data = []
#       begin
#         data = CSV.parse(csv_string, options)
#       rescue Exception  => ex
#         Rails.logger.info ex.message
#       end
#       CSV.parse(csv_string, options) do |row|
#            begin
#                data_rows << row
#            rescue Exception => ex
#              Rails.logger.info ex.message
#            end
#        end
#
#
#       OagSchedule.load_hub_schedule(hub,  data)
#
#
#  end
#  def parse_cxx cxx, csv_string
#
#       # Read remaining rows as CSV file
#       CSV::Converters[:oag_converters]  = body_converters
#       options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
#       data_rows = []
#       data = []
#       begin
#         data = CSV.parse(csv_string, options)
#       rescue Exception  => ex
#         Rails.logger.info ex.message
#       end
#       CSV.parse(csv_string, options) do |row|
#            begin
#                data_rows << row
#            rescue Exception => ex
#              Rails.logger.info ex.message
#            end
#        end
#       if data.blank?
#         data = data_rows unless data_rows.blank?
#       end
#       OagSchedule.load_cxx_schedule(cxx,  data)
#
#  end
#  def parse_large_cxx cxx, csv_filepath
#
#        csv_file    = File.open(csv_filepath, 'r')
#        file_data    = []
#        file_set     = []
#        csv_header  = nil
#        blocks = 0
#        block_size = 10000
#
#        csv_file.each do |line|
#          if csv_file.lineno.eql? 1
#            csv_header = line
#          else
#            file_set << line
#          end
#          if 0.eql? (csv_file.lineno % block_size)
#            puts "Scanning line number #{csv_file.lineno}"
#            file_data << file_set.dup
#            file_set = []
#            blocks += 1
#          end
#        end
#        csv_file.close
#
#        CSV::Converters[:oag_converters]  = body_converters
#        options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
#        parsed_data = []
#        parsed_data = Parallel.map_with_index(file_data, :in_processes=>4) do |csv_set, idx|
#          csv_set.unshift csv_header
#          csv_string = csv_set.join
#          begin
#            parsed_set = CSV.parse(csv_string, options)
#            puts "Parsing Block # #{idx+1} of #{blocks} blocks containing #{block_size} rows."
#            parsed_set
#          rescue Exception  => ex
#                 Rails.logger.info ex.message
#          end
#        end
#        OagSchedule.load_large_cxx_schedule(cxx,  parsed_data)
#
#   end
#
#    #def import_tmp
#    #   files = Dir.glob("data/oag/pending/*.csv")
#    #   ts = Time.now.strftime("%Y-%m-%d-%H%M%S%z")
#    #   files.each do |tmpfile_path|
#    #      archive_path      = "#{tmpfile_path}.zip"
#    #      Zip::Archive.open(archive_path, Zip::CREATE | Zip::TRUNC) do |ar|
#    #            ar.add_file(tmpfile_path) # add file to zip archive
#    #      end
#    #      puts "processing left over file'#{tmpfile_path}"
#    #
#    #      url = S3Uploader.save archive_path
#    #
#    #      OAGReport.first_or_create!(:url => url,
#    #                                 :filename => File.basename(tmpfile_path),
#    #                                 :datecode => Date.today.strftime("%Y%m%d"),
#    #                                 :report_type => "FailedReport")
#    #
#    #
#    #
#    #      csv_string = File.readlines(tmpfile_path).join
#    #      import_data csv_string
#    #      File.delete tmpfile_path
#    #      File.delete archive_path
#    #    end
#    # end
#
#
#
#  end
#end
