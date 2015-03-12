json.array!(@messages) do |message|
  json.extract! message, :id, :name, :content
  json.url message_url(message, format: :json)
end
