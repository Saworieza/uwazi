json.array!(@bills) do |bill|
  json.extract! bill, :id, :title, :summary, :date
  json.url bill_url(bill, format: :json)
end
