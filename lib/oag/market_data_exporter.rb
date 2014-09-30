require 'zip'
require 'aws-sdk'
class MarketDataExporter
  def initialize(attrs)
    # @s3_path = attrs.fetch('s3_path')
    @export_report_keys = ['SIN']
  end



  def export_to_s3
    csv_files = {}

    @export_report_keys.each do |report_key|

      zipfile_name = 'abb_markets.zip'
      markets = Destination.keyed(report_key)
      .pluck(:origin_code, :hub_code, :dest_code)
        # .where('destinations.cxr1 != destinations.cxr2')

      csv_string = CSV.generate do |csv|
          csv << ['origin, via, dest']
          markets.each do |mkt|
            csv << mkt
          end
      end

      csv_files["abb_via_#{report_key.parameterize.underscore.downcase}_markets.csv"] = csv_string


      # stringio = Zip::OutputStream::write_buffer do |zio|
      #   csv_files.each do |csv_file_name, csv_file|
      #     zio.put_next_entry(csv_file_name) #Filename
      #     zio.write(csv_file)  #generated content
      #   end
      # end
      # stringio.rewind #reposition buffer pointer to the beginning
      # zipped_file = File.new(zipfile_name,"w")
      # zipped_file.write(stringio.sysread) #write buffer to zipfile
      s3 = AWS::S3.new(region: s3_region, access_key_id: access_key_id, secret_access_key: secret_access_key)
      # s3 = Aws::S3::Resource.new(region: s3_region, access_key_id: access_key_id, secret_access_key: secret_access_key)
      # bucket = s3.bucket(bucket_name())
      # bucket_obj = bucket.object("abb_via_#{report_key.parameterize.underscore.downcase}_markets.csv")
      # bucket_obj.put(body: csv_string)
      bucket = s3.buckets[bucket_name()]
      bucket_obj = bucket.objects["abb_via_#{report_key.parameterize.underscore.downcase}_markets.csv"]
      bucket_obj.write(data: csv_string)
      bucket_obj.public_url
    end

  end

  private

  def access_key_id
    ENV['abb_aws_access_key_id'] or raise 'AWS Access Key ID not set'
  end

  def secret_access_key
    ENV['abb_aws_secret_access_key'] or raise 'AWS Secret Access Key not set'
  end
  def s3_region
    ENV['s3_region'] or raise 'AWS bucket path'
  end
  def bucket_name
     ENV['bucket_name'] or raise 'AWS bucket path'
  end

end