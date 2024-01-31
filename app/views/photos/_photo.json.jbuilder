json.extract! photo, :id, :title, :description, :location, :obtained_at, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
