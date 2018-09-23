class Company < ApplicationRecord
    belongs_to :user
    
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
    include ImageProcessing::MiniMagick
end

require "image_processing/mini_magick"

class ImageUploader < Shrine
    plugin :processing # allows hooking into promoting
    plugin :versions   # enable Shrine to handle a hash of files
    plugin :delete_raw # delete processed files after uploading
  
    process(:store) do |io, context|
      versions = { original: io, large: size_800, medium: size_500, small: size_300 } # retain original
  
      io.download do |original|
        pipeline = ImageProcessing::MiniMagick.source(original)
  
        versions[:large]  = pipeline.resize_to_limit!(800, 800)
        versions[:medium] = pipeline.resize_to_limit!(500, 500)
        versions[:small]  = pipeline.resize_to_limit!(300, 300)
      end
  
      versions # return the hash of processed files
    end
  end