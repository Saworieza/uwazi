json.array!(@politicians) do |politician|
  json.extract! politician, :id, :full_name, :born, :telephone
  json.url politician_url(politician, format: :json)
end
