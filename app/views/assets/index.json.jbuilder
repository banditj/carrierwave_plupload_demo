json.array!(@assets) do |asset|
  json.extract! asset, :name, :image, :gallery_image, :video
  json.url asset_url(asset, format: :json)
end
