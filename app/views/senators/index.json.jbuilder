json.array!(@senators) do |senator|
  json.extract! senator, :id, :full_name, :born, :telephone
  json.url senator_url(senator, format: :json)
end
