require "shrine"

case Rails.configuration.upload_server
when :s3, :s3_multipart
  require "shrine/storage/s3"
  
  s3_options = Rails.application.credentials.s3
  
  Shrine.storages = {
      cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
      store: Shrine::Storage::S3.new(**s3_options),
  }
when :app
  require "shrine/storage/file_system"
  
  Shrine.storages = {
      cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
      store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),
  }
end

Shrine.plugin :activerecord
Shrine.plugin :instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives
Shrine.plugin :derivation_endpoint,
              secret_key: Rails.application.secret_key_base

case Rails.configuration.upload_server
when :s3
  Shrine.plugin :presign_endpoint, presign_options: -> (request) {
    filename = request.params["filename"]
    type = request.params["type"]
    
    {
        content_disposition: ContentDisposition.inline(filename),
        content_type: type,
        content_length_range: 0..(10 * 1024 * 1024),
    }
  }
when :s3_multipart
  Shrine.plugin :uppy_s3_multipart
when :app
  Shrine.plugin :upload_endpoint
end
