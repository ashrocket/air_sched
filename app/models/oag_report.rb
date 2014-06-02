class OagReport < ActiveRecord::Base

  def create_from_msg msg
       @msg_id     =
       @msg_status = 'received'
       @received   = Time.now
       @mail_type  = 'unknown'
       if msg.uploader and msg.stored_filename
         @filename = File.join( msg.uploader.store_dir,  msg.stored_filename)
       end
       save
  end

end
