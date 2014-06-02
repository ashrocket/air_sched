#require 'net/imap'
#
#
#module Oag
#  module Email
#
#  extend self
#
#
#  mattr_accessor :imap_connection
#  @@imap_connection = nil
#  mattr_accessor :oag_uid_validity
#  mattr_accessor :oag_imap_uids
#  mattr_accessor :oag_imap_envelopes
#  mattr_accessor :oag_imap_headers
#  mattr_accessor :oag_imap_rfc822_headers
#  mattr_accessor :oag_imap_attachment_infos
#
#  def self.configure
#      yield self
#  end
#  #-------------------------
#  # Server Operations
#  #-------------------------
#  def delete_msg uid
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      srv = imap()
#      srv.uid_store(uid.to_i, "+FLAGS", [:Deleted]) #Mark Deleted in INBOX
#      delete_cached(uid)
#    end
#  end
#
#
#  def safe_store path, uid
#    begin
#       srv = imap()
#       Rails.logger.info "Archiving msg #{uid} to #{path}"
#       srv.uid_copy(uid.to_i, path)
#       srv.uid_store(uid.to_i, "+FLAGS", [:Deleted]) #Mark Deleted in INBOX
#       delete_cached(uid)
#    rescue Net::IMAP::NoResponseError => e
#       if e.message =~ / destination folder does not exist/ or e.message =~ /Unknown namespace/ or e.message =~ /Mailbox doesn't exist/
#         create_folders path
#         srv.uid_copy(uid.to_i, path)
#         srv.uid_store(uid.to_i, "+FLAGS", [:Deleted]) #Mark Deleted in INBOX
#         delete_cached(uid)
#       end
#    end
#  end
#
#  # -------------------------------------
#  # Composite Operations
#  # -------------------------------------
#
#  def archive_and_delete_msg msg
#    if msg[:m].subject =~ /#{OAGConfig[:scheduled_subject_line]} - HUB[^a-zA-Z0-9]?[A-z]{3}/
#      matches = msg[:m].subject.match /#{OAGConfig[:scheduled_subject_line]} - HUB[^a-zA-Z0-9]?([A-z]{3})/
#      hub = matches.captures.first
#      safe_store ["INBOX","unprocessed","#{hub}"].join(imap_delim()), msg[:uid]
#    else
#      safe_store ["INBOX","unprocessed"].join(imap_delim()), msg[:uid]
#    end
#  end
#
#
#
#
#  # -------------------------------------
#  # Connection API
#  # Active API for mail processing
#  # -------------------------------------
#  # TODO: Net::IMAP::NoResponseError: Maximum number of connections from user+IP exceeded (mail_max_userip_connections)
#  def imap
#    begin
#      Rails.logger.info "imap_connection : #{imap_connection}"
#      if @@imap_connection and not @@imap_connection.disconnected?
#        return @@imap_connection
#      else
#        @@imap_connection = connect()
#      end
#    rescue Exception => error
#      if error.is_a? Net::IMAP::ResponseError
#        @@imap_connection = connect()
#      else
#        Rails.logger.info error.message   # send to log file, db, or email
#      end
#    ensure
#      @@imap_connection = connect() if @@imap_connection.disconnected? or @@imap_connection.nil?
#    end
#    @@imap_connection
#  end
#
#
#
#
#  def archive_msgs uids
#    email_msgs = fast_msg_hdrs uids
#    email_msgs.map!{|email_msg| {uid:email_msg[:uid], m: email_msg[:msg] }}
#    Parallel.each(email_msgs, :in_threads=>5){|msg| archive_and_delete_msg(msg)}
#    #uids.each{|uid| archive_msg uid}
#    imap().expunge()
#  end
#
#
#  def auto_archive
#     srv    = imap()
#     uids   = srv.uid_search(["NOT", "DELETED", "FROM", OAGConfig[:oag_address], "SUBJECT", OAGConfig[:scheduled_subject_line]])
#
#
#     # alternative approach
#     #summaries = Parallel.map(msg_ids, :in_threads=>3){|msg_id|
#     summaries = uids.map do |uid|
#        {uid: uid,
#         m: cached_envelope(uid)
#         }
#     end
#     g_summaries = summaries.group_by{|msg| msg[:m].subject}
#     archive_queue = []
#     g_summaries.each  do |subject, msgs|
#          # Keep only the most recent of each subject.
#            msgs.sort_by!{|m| m[:m].date}
#            msgs.pop
#            msgs.each{|m| archive_queue << m}
#     end
#     archive_ids = []
#     archive_queue.each do |msg|
#       archive_ids << msg[:uid]
#       archive_and_delete_msg(msg)
#     end
#     srv.expunge()
#     return archive_ids
#
#  end
#
#
#  def clean_msgs uids
#    srv = imap()
#    uids.each{|uid| delete_msg uid}
#    srv.expunge()
#  end
#
#
#  def auto_clean
#     begin
#       srv = imap()
#       address_filter = OAGConfig[:source_address].map!{|a| ["FROM", a]}.flatten
#       junk_ids = srv.uid_search(["NOT", "DELETED", "NOT", "OR"] + address_filter)
#       Rails.logger.info "Removing messages #{junk_ids}"
#       clean_msgs junk_ids unless junk_ids.blank?
#       return junk_ids
#     rescue Exception  => ex
#       Rails.logger.infoex.message
#     end
#  end
#
#
#
#  def process_msgs uids
#    jobs = []
#    uids.each do |uid|
#     task_details = Oag::Message.process_msg uid
#     jobs <<  task_details
#     Oag::Process.delay.process_job task_details
#    end
#    jobs
#  end
#
#
#
#
#
#  def msg_ids
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      srv = imap()
#      uids        = srv.uid_search(["NOT", "DELETED"])
#      id_validity = srv.responses["UIDVALIDITY"].last if srv.responses["UIDVALIDITY"]
#      if uid_validity.eql? id_validity
#        Rails.logger.info"Server ids #{uids} cached ids #{self.imap_uids}"
#        Rails.logger.info"imap_uids & uids =  #{self.imap_uids & uids}"
#        Rails.logger.info"imap_uids.eql? uids =  #{self.imap_uids.eql? uids}"
#        #unless (imap_uids & uids).eql? uids
#        unless self.imap_uids.eql? uids
#          Oag::Email.sync_messages
#        end
#      else
#        Rails.logger.info"Msg Ids call cache invalid"
#        Oag::Email.invalidate_cache(id_validity)
#      end
#
#    end
#    self.imap_uids
#  end
#
#  def message_headers msg_ids
#    headers = []
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      headers = cached_headers msg_ids
#    end
#    headers
#  end
#  def fast_message_headers msg_ids
#    headers = []
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      headers = cached_rfc_822_headers(msg_ids)
#    end
#    headers
#  end
#
#  def messages_infos msg_ids
#    headers = []
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      headers = cached_attachment_infos msg_ids
#    end
#    headers
#
#  end
#
#
#  def msg uid
#    retry_on_exceptions(2, Net::IMAP::ResponseError) do
#      fetch_thread = Thread.start {
#         srv = imap()
#         txt = srv.uid_fetch(uid.to_i, "RFC822")[0].attr["RFC822"]
#         msg = Mail.new txt
#      }
#      result = fetch_thread.value
#      Thread.kill(fetch_thread)
#      result
#    end
#
#  end
#
#  def process_inbox
#    auto_clean
#    auto_archive
#    jobs = Oag::Message.process_msgs msg_ids()
#    jobs.each do |job|
#      Rails.logger.info job
#    end
#  end
#
#
#  def connect
#     #srv = Net::IMAP.new(OAGConfig[:server],OAGConfig[:port],true)
#     #srv = Net::IMAP.new(OAGConfig[:server],OAGConfig[:port],usessl:true, verify: false)
#    Rails.logger.info "Connecting to Imap Server"
#    srv = Net::IMAP.new(OAGConfig[:server], OAGConfig[:port], true, nil, false)
#    srv.authenticate('LOGIN', OAGConfig[:email], OAGConfig[:password])
#    Rails.logger.info "Connected to Imap Server"
#    result = srv.select('INBOX')
#    @@imap_connection = srv
#    id_validity = srv.responses["UIDVALIDITY"].last if srv.responses["UIDVALIDITY"]
#    unless uid_validity.eql? id_validity
#      Rails.logger.info"Imap connection cache invalid"
#      Oag::Email.invalidate_cache(id_validity)
#    end
#
#    srv
#  end
#
#  def async_sync_messages
#     srv      = imap()
#     msg_ids  = srv.uid_search(["NOT", "DELETED"])
#     return if self.imap_uids.eql? msg_ids# Job already completed
#
#     id_validity = srv.responses["UIDVALIDITY"].last if srv.responses["UIDVALIDITY"]
#     if uid_validity.eql? id_validity
#       Rails.logger.info"Syncing mail cache #{msg_ids}"
#       new_ids     = msg_ids - self.imap_uids
#       deleted_ids = self.imap_uids - msg_ids
#       sync_new new_ids unless new_ids.blank?
#       sync_deleted deleted_ids unless deleted_ids.blank?
#       self.imap_uids = msg_ids
#     end
#     msg_ids
#  end
#  def sync_messages
#    #Oag::Email.async_sync_messages
#    Oag::Email.delay.async_sync_messages
#  end
#
#   def invalidate_cache id_validity
#     return if self.uid_validity.eql? id_validity
#
#     Rails.logger.info "Invalidating cache existing validty #{uid_validity} new validty #{id_validity}"
#     self.imap_attachment_infos = {}
#     self.imap_envelopes = {}
#     self.imap_headers = {}
#     self.imap_rfc822_headers = {}
#     self.imap_uids = []
#     self.uid_validity = id_validity
#     Oag::Email.sync_messages
#
#   end
#
#  #-----------------------------
#  # accessor style cache methods
#  #------------------------------
#  def uid_validity
#    @@oag_uid_validity = Rails.cache.fetch("uid_validity")
#    @@oag_uid_validity
#  end
#  def uid_validity=(val)
#    @@oag_uid_validity = val
#    Rails.cache.write("uid_validity", val)
#  end
#  def imap_uids
#    @@oag_imap_uids = Rails.cache.fetch("imap_uids")
#    @@oag_imap_uids or []
#  end
#  def imap_uids=(val)
#    @@oag_imap_uids = val
#    Rails.cache.write("imap_uids", val)
#  end
#
#  def imap_envelopes
#    @@oag_imap_envelopes = Rails.cache.fetch("imap_envelopes")
#    @@oag_imap_envelopes or []
#  end
#  def imap_envelopes=(val)
#    @@oag_imap_envelopes = val
#    Rails.cache.write("imap_envelopes", val)
#  end
#  def imap_headers
#    @@oag_imap_headers = Rails.cache.fetch("imap_headers")
#    @@oag_imap_headers or []
#  end
#  def imap_headers=(val)
#    @@oag_imap_headers = val
#    Rails.cache.write("imap_headers", val)
#  end
#  def imap_rfc822_headers
#    @@oag_imap_rfc822_headers = Rails.cache.fetch("imap_rfc822_headers")
#    @@oag_imap_rfc822_headers or []
#  end
#  def imap_rfc822_headers=(val)
#    @@oag_imap_rfc822_headers = val
#    Rails.cache.write("imap_rfc822_headers", val)
#  end
#  def imap_attachment_infos
#    @@oag_imap_attachment_infos = Rails.cache.fetch("imap_attachment_infos")
#    @@oag_imap_attachment_infos or []
#  end
#  def imap_attachment_infos=(val)
#    @@oag_imap_attachment_infos = val
#    Rails.cache.write("imap_attachment_infos", val)
#  end
#
#  def delete_cached msg_id
#    %w(imap_attachment_infos imap_rfc822_headers imap_headers imap_envelopes).each do |hash_name|
#        tmp_hash = self.send(hash_name)
#        tmp_hash.delete(msg_id)
#        self.send("#{hash_name}=", tmp_hash)
#    end
#    tmp_arr = self.imap_uids
#    tmp_arr.delete(msg_id)
#    self.imap_uids = tmp_arr
#  end
#
#  #
#  #    End Older API
#  #
#
#  #
#  # End Meta Info API
#  #
#
#  # Connection API
#  # Active API for mail processing
#  #
#
#  def retry_on_exceptions(max_retries, *exceptions)
#    retry_count = 0
#    begin
#      yield
#    rescue *exceptions => ex
#      Rails.logger.info ex.message
#      if retry_count >= max_retries
#        raise
#      end
#      sleep 2
#      retry_count += 1
#      retry
#    end
#  end
#
#
#  def imap_delim
#     @@imap_delim ||= (imap().list "","INBOX").first.delim
#  end
#
#  def attachment_filename body_struct
#    return nil unless body_struct.multipart?
#    bstr_attach_part = body_struct.parts.find{|p| p.media_type.eql? "APPLICATION" and
#                       p.disposition and p.disposition.dsp_type and p.disposition.dsp_type.eql? "ATTACHMENT"}
#    return nil unless bstr_attach_part
#    return bstr_attach_part.disposition.param["FILENAME"]
#  end
#
#  def attachment_size body_struct
#    return nil unless body_struct.multipart?
#    bstr_attach_part = body_struct.parts.find{|p| p.media_type.eql? "APPLICATION" and
#                       p.disposition and p.disposition.dsp_type and p.disposition.dsp_type.eql? "ATTACHMENT"}
#    return nil unless bstr_attach_part
#    return bstr_attach_part.disposition.param["FILENAME"]
#  end
#
#
#
#  def create_folder folder
#    begin
#     imap().create folder
#    rescue Exception => e
#    end
#  end
#
#  def create_folders path
#    create_folder path
#    #folders = path.split imap_delim
#    #mail_folders = []
#    #folders.each do |f|
#    #  mail_folders << f
#    #  create_folder mail_folders.join imap_delim
#    #end
#  end
#
#
#
#
#  #----------------------
#  # Cached Mail Information
#  #----------------------
#  def sync_cached cached_hash, msg_ids
#    tmp_cache = cached_hash.dup
#    tmp_cache.delete_if{|k,v| msg_ids.include? k}
#    tmp_cache
#  end
#  def sync_arr cached_arr, msg_ids
#    tmp_arr = cached_arr.dup
#    tmp_arr.delete_if{|v| msg_ids.include? v}
#    tmp_arr
#  end
#  def sync_deleted msg_ids
#    Rails.logger.info"Removing deleted mail messages cache #{msg_ids}"
#    self.imap_attachment_infos = sync_cached self.imap_attachment_infos, msg_ids
#    self.imap_envelopes = sync_cached self.imap_envelopes, msg_ids
#    self.imap_headers = sync_cached self.imap_headers, msg_ids
#    self.imap_rfc822_headers = sync_cached self.imap_rfc822_headers, msg_ids
#    self.imap_uids = sync_arr self.imap_uids, msg_ids
#  end
#  def sync_new msg_ids
#    Rails.logger.info"Syncing new mail messages cache #{msg_ids}"
#    updated = cached_rfc_822_headers msg_ids
#    updated = cached_headers msg_ids
#    updated = cached_attachment_infos msg_ids
#    updated = cached_envelopes msg_ids
#    self.imap_uids =  msg_ids + self.imap_uids
#  end
#
#
#
#  def cached_envelope uid
#      id = uid.to_i
#      if self.imap_envelopes[id].has_key?
#        self.imap_envelopes[id]
#      else
#        env = self.imap_envelopes.dup
#        env[id] = imap().uid_fetch(id, "ENVELOPE")[0].attr["ENVELOPE"]
#        self.imap_envelopes = env
#        self.imap_envelopes[id]
#      end
#  end
#  def cached_envelopes uids
#    int_ids = uids.map{|v| v.to_i}
#    uncached_ids     = int_ids - self.imap_envelopes.keys
#    Rails.logger.info"email envelopes uncached_ids #{uncached_ids} from #{int_ids}"
#    if uncached_ids and uncached_ids.count > 0
#      uncached_envelopes = imap().uid_fetch(uncached_ids, ["ENVELOPE"])
#      tmp_envelopes = self.imap_envelopes.dup
#      if uncached_envelopes and uncached_envelopes.count > 0
#        uncached_envelopes.each{|rec| tmp_envelopes[rec.attr["UID"]] = rec.attr["ENVELOPE"]}
#      end
#      self.imap_envelopes = tmp_envelopes
#    end
#    self.imap_envelopes.select{|k,v| int_ids.include? k}
#  end
#
#  def cached_rfc_822_headers uids
#    int_ids = uids.map{|v| v.to_i}
#    uncached_ids  = int_ids - self.imap_rfc822_headers.keys
#    Rails.logger.info"rfc822 headers uncached_ids #{uncached_ids} from #{int_ids}"
#    if uncached_ids and uncached_ids.count > 0
#      uncached_headers = imap().uid_fetch(uncached_ids, ["RFC822.HEADER"])
#      tmp_headers = self.imap_rfc822_headers.dup
#      if uncached_headers and uncached_headers.count > 0
#        uncached_headers.each{|rec| tmp_headers[rec.attr["UID"]] = rec.attr["RFC822.HEADER"]}
#      end
#      self.imap_rfc822_headers = tmp_headers
#    end
#    headers =  self.imap_rfc822_headers.select{|k,v| int_ids.include? k}
#    records = []
#    headers.each do |uid, header|
#      hdr  = Mail.new header
#      records << {msg: hdr, uid: uid, attachment: hdr.multipart?, sender_name: hdr[:from].display_names.first, sender_email: hdr.from.first, subject: hdr.subject, date: hdr.date}
#    end
#    records
#  end
#  def cached_headers uids
#      int_ids = uids.map{|v| v.to_i}
#      uncached_ids     = int_ids - self.imap_headers.keys
#      Rails.logger.info"headers uncached_ids #{uncached_ids} from #{int_ids}"
#      if uncached_ids and uncached_ids.count > 0
#        uncached_headers = imap().uid_fetch(uncached_ids, ["RFC822.HEADER", "BODYSTRUCTURE"])
#        if uncached_headers and uncached_headers.count > 0
#          tmp_headers = self.imap_headers.dup
#          uncached_headers.each do |rec|
#            tmp_headers[rec.attr["UID"]] = {rfc822: rec.attr["RFC822.HEADER"], bodystruct: rec.attr["BODYSTRUCTURE"]}
#          end
#          self.imap_headers = tmp_headers
#        end
#      end
#
#      headers =  self.imap_headers.select{|k,v| int_ids.include? k}
#      records = []
#      headers.each do |uid, header|
#        hdr  = Mail.new header[:rfc822]
#        records << {  uid: uid,
#                      attachment: attachment_filename(header[:bodystruct]),
#                      sender_name: hdr[:from].display_names.first,
#                      sender_email: hdr.from.first,
#                      subject: hdr.subject,
#                      date: hdr.date
#                    }
#      end
#      records
#  end
#  def cached_attachment_infos uids
#    int_ids = uids.map{|v| v.to_i}
#    uncached_ids     = int_ids - self.imap_attachment_infos.keys
#    Rails.logger.info"attachment info uncached_ids #{uncached_ids} from #{int_ids}"
#    messages_infos  = uncached_ids.map do |uid|
#      result = nil
#      results = nil
#      unless uid.blank?
#        results = imap().uid_fetch(uid,  "RFC822")
#        if results and results.count.eql? 1
#          record = results[0]
#          message  = Mail.new(record.attr["RFC822"])
#          fn       = message.has_attachments? ? message.attachments.first.filename : nil
#          fsize    = message.has_attachments? ? message.attachments.first.body.decoded.size : nil
#          result = {
#             uid: record.attr["UID"],
#             attachment: fn,
#             attachment_size: fsize,
#             sender_name: message[:from].display_names.first,
#             sender_email: message.from.first,
#             subject: message.subject,
#             date: message.date
#          }
#        else
#          Rails.logger.info results
#          Rails.logger.info "No Email Record for Email id #{uid}"
#          Rails.logger.info imap().responses.inspect()
#        end
#      end
#      result
#    end
#    messages_infos.compact!
#    if messages_infos and messages_infos.count > 0
#      tmp_infos = self.imap_attachment_infos.dup
#      messages_infos.each do |messages_info|
#        tmp_infos[messages_info[:uid]] = messages_info
#      end
#      self.imap_attachment_infos = tmp_infos
#    end
#    selected = self.imap_attachment_infos.select{|k,v| int_ids.include? k}
#    selected.map{|k,v| v unless v.blank?}.compact
#  end
#
#
#
#
#
#  #----- Delete these operations, they should be unused
#    #def cached_rfc_822_header uid
#  #  if imap_rfc822_headers[uid].has_key?
#  #    imap_rfc822_headers[uid]
#  #  else
#  #    rec = imap().uid_fetch(uid.to_i, "RFC822.HEADER")[0]
#  #    imap_rfc822_headers[rec.attr["UID"]] = rec.attr["RFC822.HEADER"]
#  #    imap_rfc822_headers[uid]
#  #  end
#  #end
#  #def message_info uid
#  #  retry_on_exceptions(2, Net::IMAP::ResponseError) do
#  #    fetch_thread = Thread.start {
#  #       srv = imap()
#  #       rec = srv.uid_fetch(uid.to_i, "RFC822")[0]
#  #       msg  = Mail.new rec.attr["RFC822"]
#  #       fn     = msg.has_attachments? ? msg.attachments.first.filename : nil
#  #       fsize = msg.has_attachments? ? msg.attachments.first.body.decoded.size : nil
#  #       {uid: rec.attr["UID"], attachment: fn, attachment_size: fsize,
#  #        sender_name: msg[:from].display_names.first, sender_email: msg.from.first, subject: msg.subject, date: msg.date}
#  #    }
#  #    result = fetch_thread.value
#  #    Thread.kill(fetch_thread)
#  #    result
#  #  end
#  #end
#  #def all_msg
#  #  srv = imap()
#  #  uids        = srv.uid_search(["NOT", "DELETED"])
#  #  messages = []
#  #  uids.each do |message_id|
#  #       message =  Mail.new srv.uid_fetch(message_id, "RFC822")[0].attr["RFC822"]
#  #       messages << {:uid => message_id, :m => message}
#  #  end
#  #  srv.logout()
#  #  srv.disconnect()
#  #  return messages
#  #end
#  #def msg_hdr uid
#  #   retry_on_exceptions(2, Net::IMAP::ResponseError) do
#  #    txt = cached_rfc_822_header(uid)
#  #    msg = Mail.new txt
#  #   end
#  # end
#  #def archive_msg msg_id
#  #  #email_msg = msg_hdr msg_id
#  #  msg = {uid:msg_id, m: email_msg }
#  #  archive_and_delete_msg(msg)
#  #end
#     # Older API for MailHandling
#   #def register callback
#  #  @mail_handler = callback
#  #end
#  #def mail_handler
#  #  @mail_handler ||= proc { |message| Rails.logger.infomessage.subject }
#  #end
#  #def receive message
#  #  unless @mail_handler
#  #    Rails.logger.info"** No Message Handler defined"
#  #    # Todo, raise exception for AirBrake handling
#  #  end
#  #  mail_handler.call message
#  #end
#
#  #def valid_email_source? addr
#  #  OAGConfig[:source_address].each do |src|
#  #
#  #     if addr.eql? src.downcase
#  #       return  true
#  #     end
#  #  end
#  #  false
#  #end
#  #def valid_subject? subj
#  #  OAGConfig[:valid_subject_words].each do |subject_line|
#  #    if subj =~ /#{subject_line}/
#  #      return true
#  #
#  #    end
#  #  end
#  #  false
#  #end
#
#end
#end
#
