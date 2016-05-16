json.array!(@senators) do |senator|
  json.extract! senator, :id, :avatar, :description, :web, :full_name, :born, :telephone
  json.url senator_url(senator, format: :json)
end
