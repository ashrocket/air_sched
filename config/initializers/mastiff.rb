require 'fileutils'
require 'redis'

Mastiff.configure do |config|

  Mastiff::Email.configure do |email_config|

    # IMAP server account settings
    email_config.settings =  {  address:        ENV["MASTIFF_MAILHOST"],
                                port:           ENV["MASTIFF_PORT"],
                                user_name:      ENV["MASTIFF_EMAIL_ADDRESS"],
                                password:       ENV["MASTIFF_PASSWORD"],
                                authentication: nil,
                                enable_ssl:     true }


  end



  # Redis Objects Option configuration
  Mastiff::Email::Message.redis = Redis.new(config.redis_options)

  # https://gist.github.com/jnunemaker/230531
  # Allows accessing config variables from mastiff.yml like so:
  #   MastiffConfig[:server] => imap.gmail.com
  if File.exists? File.join(Rails.root, 'config', 'mastiff.yml')
    raw_config = File.read(File.join(Rails.root, 'config', 'mastiff.yml'))
    config.message_settings = YAML.load(raw_config)[Rails.env].symbolize_keys
  end

  # Background Workers are called using class methods, not object methods,
  # so we need to initialize based on the class, not an instance

  # Worker to decode and store attachments
  config.sync_attachment_worker     = SyncAttachmentWorker
  # Worker to process attachments and perform an action
  config.process_attachment_worker  = ProcessAttachmentWorker
  # Class to store attachment
  config.attachment_uploader        =  MailAttachmentUploader

  #  You REALLY should use an Explicit Directory Here so you can find attachments
  # when imports fail
  # config.attachment_dir      = "data/attachments/pending"
  #config.process_dir      = "data/attachments/processed"

  # Mailbox Options
  config.mailbox_folders = config.mailbox_folders.merge({processed: 'processed',
                                                         rejected: 'rejected',
                                                         processing: 'processing'})
  ul = config.attachment_uploader.new

  if ul.store_dir.eql? '/tmp'
    tmp_path =  File.dirname(Tempfile.new('foo'))
    if FileUtils.mkpath(File.join(tmp_path ,'mastiff'))
      Mastiff.attachment_dir  = File.join(tmp_path ,'mastiff')
    else
      Mastiff.attachment_dir = ''
    end
    ul = config.attachment_uploader.new
  end
  File.directory?(ul.store_dir) or
      abort "Gem requires local storage path for mail attachments - #{ul.store_dir} does not exist!\n" +
          "to generate path, execute\n" +
          "rake mastiff:init_paths['#{ul.store_dir}']"
end

