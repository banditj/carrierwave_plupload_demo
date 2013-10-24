class AssetAssignment < ActiveRecord::Base
  belongs_to :asset
  belongs_to :link, :polymorphic => true
end
