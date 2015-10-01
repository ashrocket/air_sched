require 'zip'
require 'aws-sdk'
module Oag

class SmartRoutesExporter

  # TODO make this configurable with an App Config Setting or as a Brand attribute
  def filename(brand)
    "#{brand.brand_key.downcase}_route_map.#{Date.today}.#{DateTime.now.in_time_zone.hour}-#{DateTime.now.in_time_zone.min}.json"
  end

  #TODO: use temp files instead of Files
  def export_to_s3(brand)
    s3_location = ''

    zipfile_name = filename(brand) + '.zip'

    r = Oag::Report.new

    stringio = Zip::OutputStream::write_buffer do |zio|
        zio.put_next_entry(filename(brand)) #Filename
        zio.write(r.brand_route_map_document(brand))  #generated content
    end
    stringio.rewind #reposition buffer pointer to the beginning


    zipped_file = File.new(zipfile_name,"w+")
    zipped_file.write(stringio.sysread) #write buffer to zipfile
    zipped_file.rewind

    client       = Aws::S3::Client.new(region: s3_region, access_key_id: access_key_id, secret_access_key: secret_access_key)
    resource     = Aws::S3::Resource.new(client: client)

    bucket       = resource.create_bucket(bucket: bucket_name())
    bucket_obj   = bucket.object(zipfile_name)

    bucket_obj.put(body: IO.read(zipped_file))
    s3_location  =  bucket_obj.public_url

    File.delete(zipfile_name)
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
    ENV['s3_region'] or raise 'AWS region error'
  end
  def bucket_name
     ENV['routes_bucket_name'] or raise 'AWS routes bucket path'
  end

end

end