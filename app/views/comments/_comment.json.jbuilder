json.extract! comment, :id, :title, :description, :user_id, :request_id, :created_at, :updated_at
json.url request_comments_url(comment, format: :json)