class Page < ActiveRecord::Base
  include Assetable

  has_assets :images  , type: Image
  has_asset :video  , type: Video

end

