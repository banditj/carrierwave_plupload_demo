class Dog < ActiveRecord::Base
  include Assetable

  has_asset :image

end
