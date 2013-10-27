class AssetLink < ActiveRecord::Base
  belongs_to :asset
  belongs_to :linker, :polymorphic => true
end
