json.extract! profile, :id, :user_id, :firstname, :lastname, :birthday, :about, :gender, :created_at, :updated_at
json.url profile_url(profile, format: :json)