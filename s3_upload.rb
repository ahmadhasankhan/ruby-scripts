require 'aws'

AWS.config(
    :access_key_id => 'MY_ACCESS_KEY',
    :secret_access_key => 'MY_SECRET_KEY',
)

#Set the filename
file_name = 'name.txt'

#Set the bucket name
s3_bucket_name = 'my bucket name'

#If file has to go in some specific folder
bucket_directory = 'key or folder'

begin
  s3 = AWS::S3.new

  #Uncomment and update the file extension if you want to fix the file type
  #file_name = "#{file_name}.txt"

  #Check if directory name has provided and Make an object in your bucket for your upload
  if bucket_directory == ''
    bucket_obj = s3.buckets[s3_bucket_name].objects[bucket_directory]
  else
    bucket_obj = s3.buckets[s3_bucket_name].objects["#{bucket_directory}/#{file_name}"]
  end

  # Upload the file
  bucket_obj.write(:file => "files/#{file_name}")
  puts "File was successfully uploaded : #{bucket_obj}"
rescue Exception => e
  puts "There was an error in uploading file: #{e}"
end