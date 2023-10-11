class UsersigninSerializer < ActiveModel::Serializer
  attributes  :id, :name, :email, :updated_at, :auth_token,:token_type
  # def created_date 
  #   current_user.created_at && current_user.created_at.strftime("%A %B %Y")
  # end
  def token_type
    "Bearer"
  end
end
