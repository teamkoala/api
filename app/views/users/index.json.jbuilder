json.array! @users do |user|
  json.user do
    json.name user.name
  end
end