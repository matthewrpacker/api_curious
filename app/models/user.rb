class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.provider = auth_info.provider
      new_user.uid = auth_info.uid
      new_user.name = auth_info.info.name
      new_user.token = auth_info.credentials.token
      new_user.secret = auth_info.credentials.secret
      new_user.nickname = auth_info.info.nickname
      new_user.email = auth_info.info.email
      new_user.image_url = auth_info.info.image
    end
  end
end
