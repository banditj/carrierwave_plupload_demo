class Page < ActiveRecord::Base

  has_many :asset_assignments, as: :link
  has_one :asset_assignment, as: :link

  has_many :gallery_images, -> { where "usecase = 'gallery'" },  through: :asset_assignments , :source => :asset
  has_many :images, -> { where "usecase = 'images'" },  through: :asset_assignments , :source => :asset
  has_one :background_image, -> { where "usecase = 'background'" },  through: :asset_assignment , :source => :asset

end
