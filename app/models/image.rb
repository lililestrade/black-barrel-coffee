class Image < ApplicationRecord
  # # adds an `image` virtual attribute
  # include ::PhotoUploader::Attachment.new(:image)
  # include ImageUploader[:image]
  include ::ImageUploader::Attachment.new(:image)
end
