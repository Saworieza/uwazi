json.array!(@contests) do |contest|
  json.extract! contest, :id, :name, :contestType, :location_type, :code
  json.url contest_url(contest, format: :json)
end
