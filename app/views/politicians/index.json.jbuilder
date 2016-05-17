json.array!(@politicians) do |politician|
  json.extract! politician, :id, :full_name, :born, :avatar, :telephone, :web, :description, :email
  json.url politician_url(politician, format: :json)
end
