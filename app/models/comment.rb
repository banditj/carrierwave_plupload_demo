class Comment < ActiveRecord::Base

  has_many :asset_assignments, -> { where "usecase = 'images'" }
  has_many :images, :as=>:link, :through => :asset_assignments


end
