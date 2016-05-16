json.array!(@counties) do |county|
  json.extract! county, :id, :name, :description
  json.url county_url(county, format: :json)
end
