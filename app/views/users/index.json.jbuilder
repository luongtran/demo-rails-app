json.array!(@users) do |user|
  json.extract! user, :id,:username,:email,:password,:remember_digest,:first_name,:last_name,:title,:company
  json.url user_url(user, format: :json)
end
