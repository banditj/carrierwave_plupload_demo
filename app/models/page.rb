class Page < ActiveRecord::Base
  include Assetable

  has_assets :images  , type: Image
  has_asset :video  , type: Video

  #has_many :images, -> { where "link_attr = 'image'" },  through: :asset_assignments , :source => :asset
  #has_one :video, -> { where "link_attr = 'video'" },  through: :asset_assignment , :source => :asset

end
