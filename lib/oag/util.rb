require 'net/imap'
#require 'zipruby'
require 'zip'


module Oag
  module Util

  extend self



    def uncompress_report archive_path, tmpfile_path
      Zip::InputStream::open(archive_path) {|io|
          entry = io.get_next_entry
          File.open( tmpfile_path, 'wb'){|f| f << io.read}
      }
    end

    def compress_report archive_path, tmpfile_path
      Zip::File.open(archive_path, Zip::File::CREATE) do |zipfile|
          zipfile.add(File.basename(tmpfile_path), tmpfile_path)
      end
    end



  end
end
