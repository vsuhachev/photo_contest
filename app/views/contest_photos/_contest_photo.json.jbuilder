json.extract! contest_photo, :id, :photo_id, :contest_id, :nomination_id, :created_at, :updated_at
json.url contest_photo_url(contest_photo, format: :json)