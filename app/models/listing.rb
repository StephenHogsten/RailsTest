class Listing < ApplicationRecord
  if Rails.env.development?
    has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "http://res.cloudinary.com/dgf8hkuhc/image/upload/v1496863785/missing_ls4ayk.jpg", 
      validate_media_type: false
  else
    has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "http://res.cloudinary.com/dgf8hkuhc/image/upload/v1496863785/missing_ls4ayk.jpg", 
      validate_media_type: false,
      :storage => :cloudinary,
      :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
      :path => ':id/:style/:filename'
  end

  validates_attachment :image, 
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_presence :image
  validates :name, :description, :price, 
    presence: true
  validates :price, 
    numericality: { greater_than: 0 }

  belongs_to :user
end