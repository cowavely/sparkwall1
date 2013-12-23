json.array!(@likes) do |like|
  json.extract! like, :id, :user_id, :project_id
  json.url like_url(like, format: :json)
end
