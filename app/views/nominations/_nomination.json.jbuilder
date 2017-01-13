json.extract! nomination, :id, :title, :description, :contest_id, :created_at, :updated_at
json.url nomination_url(nomination, format: :json)