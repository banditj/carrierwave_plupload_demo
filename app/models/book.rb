class Book < ActiveRecord::Base

  include Assetable

  has_asset :cover, type: Image
  has_assets :scanned_pages, type: Image

  default_scope { includes("asset_links") }
end
