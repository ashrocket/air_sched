require 'csv'
require 'parallel'

module Oag
  module Import
  extend self



  def body_converters
         return lambda{|s, details|
            begin
              if [:localarrtime,:localdeptime].include? details.header
                "%04d" % s.to_i
              else
                s
              end
            rescue Exception  => ex
              Rails.logger.info ex.message
              s
            end
          }

    end
  def parse_report report

    csv_string  = report.report_file_string


    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
    data    = []
    begin
     data = CSV.parse(csv_string, options)
    rescue Exception  => ex
     Rails.logger.info ex.message
    end
    tstart = Time.now
    report.load_status["processing_time"] = Time.now - tstart
    data
  end

  def parse_large_report report
    csv_file    = File.open(report.load_status["report_path"], 'r')
    file_data    = []
    file_set     = []
    csv_header  = nil
    blocks = 0
    block_size = 10000

    csv_file.each do |line|
     if csv_file.lineno.eql? 1
       csv_header = line
     else
       file_set << line
     end
     if 0.eql? (csv_file.lineno % block_size)
       puts "Scanning line number #{csv_file.lineno}"
       file_data << file_set.dup
       file_set = []
       blocks += 1
     end
    end
    csv_file.close


    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
    parsed_data = []
    parsed_data = Parallel.map_with_index(file_data, :in_processes=>4) do |csv_set, idx|
     csv_set.unshift csv_header
     csv_string = csv_set.join
     begin
       parsed_set = CSV.parse(csv_string, options)
       Rails.logger.info "Parsing Block # #{idx+1} of #{blocks} blocks containing #{block_size} rows."
       parsed_set
     rescue Exception  => ex
            Rails.logger.info ex.message
     end
    end
    #OagSchedule.load_large_cxx_schedule(cxx,  parsed_data)


  end


  def parse_and_load_report report


    # Read remaining rows as CSV file
    line_count = %x{wc -l < "#{report.load_status["report_path"]}"}.to_i
    if line_count < 100000

       schedule_rows = parse_report(report)
       OagSchedule.process_schedules(report, schedule_rows)
    else
       schedule_rows = parse_large_report(report)

    end

  end




  end
end
