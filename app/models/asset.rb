class Asset < ActiveRecord::Base

  has_many :asset_links

  def link(linker, linker_attr)
     asset_links.create(asset:self, linker: linker, linker_attr:linker_attr)
  end

  def unlink(linker, linker_attr)
    asset_links.where(linker: linker, linker_attr: linker_attr)
  end

end
