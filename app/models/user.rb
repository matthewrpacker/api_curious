class User
  attr_accessor :id, :username

  def initialize(id)
    @id = id
  end
  # def self.find_or_create_from_auth_hash(auth)
  #   where(uid: auth[:uid]).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.token = auth.credentials.token
  #     user.secret = auth.credentials.secret
  #     user.nickname = auth.info.nickname
  #     user.email = auth.info.email
  #     user.image_url = auth.info.image
  #   end
  # end
end
