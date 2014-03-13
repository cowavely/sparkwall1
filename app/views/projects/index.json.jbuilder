json.array!(@projects) do |project|
  json.extract! project, :id, :header, :description, :image, :user_id
  json.url project_url(project, format: :json)
end
