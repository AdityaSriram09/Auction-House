class Product < ApplicationRecord
  # This is to say that every product belongs to a user.
  belongs_to :user
  # mount uploader for carrierwave
  mount_uploader :image, ImageUploader
end
