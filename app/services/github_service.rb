class GithubService
  def initialize
    @connection = Faraday.new("http://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_users
    # response = @connection.get "artists"
    # parse(response.body)
    response = @connection.get do |req|
      req.url "users/#{id}"
      # req.params['key'] = 'value'
    end

    parse(response.body)
  end

  def get_user(id)
    response = @connection.get "users/#{id}"
    parse(response.body)
  end

  def create_user(users_hash)
    response = @connection.post("users?name=#{users_hash['name']}")
    parse(response.body)
  end
byebug
  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end

GithubService.new
