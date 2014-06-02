require 'net/imap'
#require 'zipruby'
require 'zip'


module Oag
  module Message

  extend self


    #
    # Meta Info API section
    def scheduled_hub? msg
        msg.subject =~ /#{OAGConfig[:scheduled_hub_subject_line]}/
    end
    def scheduled_cxx? msg
      msg.subject =~ /#{OAGConfig[:scheduled_cxx_subject_line]}/
    end

    def on_demand? msg
      msg.subject =~ /#{OAGConfig[:manual_subject_line]}/
    end



    def process_attachment message, msg_type

      report            = message.attachments.first
      ts                = message.date.strftime("%Y-%m-%d-%H%M%S%z")
      tmpfile_name      = "#{File.basename report.filename.squish.downcase.tr(" ","_")}.#{ts}.csv"
      tmpfile_path      =  File.join('data','oag','pending',tmpfile_name)
      archive_path      = "#{tmpfile_path}.zip"
      case msg_type
      when "SCHEDULED"
          # Save Attachment Zip File, and Uncompressed File
          File.open(archive_path, "w+b", 0644 ) { |f| f.write report.body.decoded }
          Oag::Util.uncompress_report(archive_path,tmpfile_path)

      when "ONDEMAND"
          # Save Attachment, and save a zipped version of it
          File.open( tmpfile_path, "w+b", 0644 ) { |f| f.write report.body.decoded }
          Oag::Util.compress_report(archive_path, tmpfile_path)

      end
      return archive_path, tmpfile_path
    end


    def process_scheduled_hub_msg msg
        archive_path, tmpfile_path = Oag::Message.process_attachment msg, "SCHEDULED"
        task_details = {}
        if msg.subject =~ /-\sHUB.?\w+/
          matches = msg.subject.match(/ - HUB[^a-zA-Z0-9]?([A-z]{3})/)
          hub = matches.captures.first
          task_details = {job:"HUB", key: hub}
        else
          task_details = {job:"REJ"}
        end
        task_details.merge(archive: archive_path, tmpfile: tmpfile_path)

    end

    def process_scheduled_cxx_msg msg
       archive_path, tmpfile_path = Oag::Message.process_attachment msg, "SCHEDULED"
       task_details = {}
       if msg.subject =~ / - [^a-zA-Z0-9]?[a-zA-Z0-9]/
         matches = msg.subject.match(/ - CXX[^a-zA-Z0-9]?([a-zA-Z0-9]{2,3})/)
         cxx = matches.captures.first
         task_details = {job:"CXX", key: cxx}
       else
         task_details = {job:"REJ"}
       end
       task_details.merge(archive: archive_path, tmpfile: tmpfile_path)
    end

    def process_on_demand_msg msg
      archive_path, tmpfile_path = Oag::Message.process_attachment msg, "ONDEMAND"
      report                     =  msg.attachments.first

      task_details = {}
      if report.filename =~ /^HUB.?\w+/
         matches = report.filename.match /HUB[^a-zA-Z0-9]?([A-z]{3})/
         hub = matches.captures.first
         task_details = {job:"HUB", key: hub}
      elsif report.filename =~ /^CXX[^a-zA-Z0-9]?[a-zA-Z0-9]{2,3}/
         matches = report.filename.match /CXX[^a-zA-Z0-9]?([a-zA-Z0-9]{2,3})/
         cxx = matches.captures.first
         task_details = {job:"CXX", key: cxx}
      else
         task_details = {job:"REJ"}
      end
      task_details.merge(archive: archive_path, tmpfile: tmpfile_path)
    end

    def process_msg uid
      message = Oag::Email.msg uid
      task_details = nil
      task_details = Oag::Message.process_on_demand_msg(message)  if Oag::Message.on_demand? message
      task_details = Oag::Message.process_scheduled_hub_msg(message) if Oag::Message.scheduled_hub? message
      task_details = Oag::Message.process_scheduled_cxx_msg(message) if Oag::Message.scheduled_cxx? message
      if task_details
        Oag::Email.safe_store ["INBOX","processed",task_details[:key]].join(Oag::Email.imap_delim()), uid
      else
        Oag::Email.safe_store ["INBOX","unprocessed",task_details[:key]].join(Oag::Email.imap_delim()), uid
      end
      return task_details
    end

  end
end
