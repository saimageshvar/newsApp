json.array!(@subscribes) do |subscribe|
  json.extract! subscribe, :id, :user_id, :feed_id
  json.url subscribe_url(subscribe, format: :json)
end
