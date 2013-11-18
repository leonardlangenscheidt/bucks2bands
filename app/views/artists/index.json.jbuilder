json.array!(@artists) do |artist|
  json.extract! artist, :name, :label, :genre, :bio
  json.url artist_url(artist, format: :json)
end
