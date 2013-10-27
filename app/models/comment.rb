class Comment < ActiveRecord::Base
  include Assetable

  has_asset :film, type: Video

end
