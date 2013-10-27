module Assetable
  extend ActiveSupport::Concern

  included do
    has_many :asset_assignments, as: :link
    has_one :asset_assignment, as: :link
  end

  module ClassMethods

    def has_assets(plural_name, *options)
      has_many plural_name, -> { where "link_attr = '#{plural_name.to_s}'" },  through: :asset_assignments , :source => :asset

      # set method for receiving array with assets
      # assets=[array]
      define_method(plural_name.to_s+"=") { |assets|

        # can assign assets to self via and array
        assets.each do |asset|
          # can receive files from web directly
          if asset.class == ActionDispatch::Http::UploadedFile
            asset = Asset.new(type:options[0][:type].to_s, file:asset)
          end
          # can assign assets
          asset_assignments.build(asset: asset, link: self, link_attr:plural_name.to_s)
        end
      }

      # unlink_asset(asset)
      define_method("unlink_"+plural_name.to_s.singularize) { |asset|
        asset_assignments.where(link_attr: plural_name.to_s.singularize, id: asset.id).delete_all
      }
    end

    def has_asset(singular_name, *options)

      has_one singular_name, -> { where "link_attr = '#{singular_name.to_s}'" },  through: :asset_assignment , :source => :asset

      define_method(singular_name.to_s+"=") { |asset|
        if valid?
          # can receive files from web directly
          if asset.class == ActionDispatch::Http::UploadedFile
            asset = Asset.new(type:options[0][:type].to_s, file:asset)
          end

          asset_assignments.where(link_attr: singular_name.to_s).delete_all
          asset_assignments.build(link_attr:singular_name.to_s, asset: asset, link: self)
        end
      }

    end

  end

end