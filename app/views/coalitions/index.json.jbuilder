json.array!(@coalitions) do |coalition|
  json.extract! coalition, :id, :name, :abbrev
  json.url coalition_url(coalition, format: :json)
end
