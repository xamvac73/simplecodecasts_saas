class Company < ApplicationRecord
    belongs_to :user
    
    include ImageProcessing::MiniMagick
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
end

