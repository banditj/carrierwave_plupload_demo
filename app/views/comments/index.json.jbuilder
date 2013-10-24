json.array!(@comments) do |comment|
  json.extract! comment, :name, :cont
  json.url comment_url(comment, format: :json)
end
