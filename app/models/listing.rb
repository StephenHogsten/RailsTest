class Listing < ApplicationRecord
  has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "missing.jpg", 
    validate_media_type: false,
    :storage => :cloudinary,
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    :path => ':id/:style/:filename'
  validates_attachment :image, 
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end