class Asset < ActiveRecord::Base

  mount_uploader :image , ImageUploader
  mount_uploader :gallery_image, GalleryImageUploader
  mount_uploader :video, VideoUploader

  has_many :asset_assignments

end
