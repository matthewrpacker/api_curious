class GithubService
  attr_reader :current_user

  def initialize(current_user)
    @connection = Faraday.new "https://api.github.com/"
    @connection.adapter  Faraday.default_adapter
    @connection.params["client_id"] = ENV['GITHUB_KEY']
    @connection.params["client_secret"] = ENV['GITHUB_SECRET']
    @current_user = current_user
  end

  def user_info
    response = @connection.get("/users/#{current_user.nickname}")
    JSON.parse(response.body)
  end

  def starred_info
    response = @connection.get("/users/#{current_user.nickname}/starred")
    @starred_info_json = JSON.parse(response.body)
  end

  def repos_info
    response = @connection.get("/users/#{current_user.nickname}/repos")
    @repos_info_json = JSON.parse(response.body)
  end

  def starred_count
    @starred_info_json.count
  end

  def repos
    @repos ||= @repos_info_json.map do |hash|
      Repo.new(hash)
    end
  end
end
