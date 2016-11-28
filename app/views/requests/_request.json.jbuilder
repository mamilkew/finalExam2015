json.extract! request, :id, :topic, :description, :location, :status, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)