json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.role user.roles.first.name
  json.last_sign_in user.current_sign_in_at.nil? ? '—' : user.current_sign_in_at.to_s(:long)
  json.created_at user.created_at.nil? ? '—' : user.created_at.to_s(:long)
end
