json.array!(@profiles) do |profile|
  json.extract! profile, :firstname, :lastname, :email, :address, :mobile, :user_id
  json.url profile_url(profile, format: :json)
end
