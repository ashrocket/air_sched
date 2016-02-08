require 'zip'
require 'aws-sdk'
require 'tmpdir'

module Oag

class MarketDataExporter
  def initialize
    @export_report_keys = ['SIN']
  end

  # TODO make this configurable with an App Config Setting or as a Brand attribute
    def filename
      "abb_markets"
    end

  def export_to_s3
    csv_files = {}
    s3_location = ''
    zipfile_name = filename + '.zip'
    zipped_file = File.new(File.join(Dir.tmpdir, zipfile_name), "w+")
    # zipped_file = File.new(zipfile_name,"w+")

    @export_report_keys.each do |rk|
      report_key = ReportKey.keyed(rk)
      markets = Destination.keyed(report_key)
      .pluck(:origin_code, :hub_code, :dest_code)
        # .where('destinations.cxr1 != destinations.cxr2')

      csv_string = CSV.generate do |csv|
          csv << ['origin, via, dest']
          markets.each do |mkt|
            csv << mkt
          end
      end

      csv_files["abb_via_#{report_key.name.parameterize.underscore.downcase}_markets.csv"] = csv_string




      r = Oag::Report.new

      stringio = Zip::OutputStream::write_buffer do |zio|
       csv_files.each do |csv_file_name, csv_file|
                zio.put_next_entry(csv_file_name) #Filename
                zio.write(csv_file)  #generated content
        end
      end
      stringio.rewind #reposition buffer pointer to the beginning

      zipped_file.write(stringio.sysread) #write buffer to zipfile
    end
    zipped_file.rewind

    client       = Aws::S3::Client.new(region: s3_region, access_key_id: access_key_id, secret_access_key: secret_access_key)
    resource     = Aws::S3::Resource.new(client: client)

    bucket       = resource.create_bucket(bucket: bucket_name())
    bucket_obj   = bucket.object(zipfile_name)

    bucket_obj.put(body: IO.read(zipped_file))
    s3_location  =  bucket_obj.public_url

    File.delete(zipped_file)

    s3_location

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
     ENV['market_bucket_name'] or raise 'AWS bucket path'
  end

end

end