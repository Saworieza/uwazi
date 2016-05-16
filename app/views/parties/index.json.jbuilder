json.array!(@parties) do |party|
  json.extract! party, :id, :name, :founded, :abbrev
  json.url party_url(party, format: :json)
end
