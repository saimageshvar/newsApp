json.array!(@feeds) do |feed|
  json.extract! feed, :id, :name, :url, :c_id
  json.url feed_url(feed, format: :json)
end
