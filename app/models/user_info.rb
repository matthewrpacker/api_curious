class UserInfo
  attr_reader :name, :followers, :following, :bio, :member_since, :location

  def initialize(hash)
    @name = hash['name']
    @followers = hash['followers']
    @following = hash['following']
    @bio = hash['bio']
    @member_since = hash['created_at']
    @location = hash['location']
  end

  def member_since
    date = DateTime.parse(@member_since)
    formatted_date = date.strftime('%b %d, %Y')
  end
end
