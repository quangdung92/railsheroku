json.array!(@users) do |user|
  json.extract! user, :id, :login_id, :name, :kana, :mailaddress, :password_digest, :cybozu_id, :grant, :remember_token, :is_deleted, :is_firstlogged
  json.url user_url(user, format: :json)
end
