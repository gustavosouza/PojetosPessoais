json.array!(@admin_roles) do |admin_role|
  json.extract! admin_role, :id, :user_id, :master
  json.url admin_role_url(admin_role, format: :json)
end
