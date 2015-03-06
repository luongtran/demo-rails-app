json.array!(@products) do |product|
  json.extract! product, :id, :nanme,:price
  json.url product_url(product, format: :json)
end
