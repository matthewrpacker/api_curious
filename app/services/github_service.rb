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
    new_response = @connection.get("/users/#{current_user.nickname}")
    JSON.parse(new_response.body)
  end

  def starred_info
    starred = @connection.get("/users/#{current_user.nickname}/starred")
    JSON.parse(starred.body)
  end

  def login_name
    user_info['login']
  end

  def name
    user_info['name']
  end

  def avatar_url
    user_info['avatar_url']
  end

  def repos_url
    user_info['repos_url']
  end

  def public_repos_count
    user_info['public_repos']
  end

  def gists_url
    user_info['gists_url']
  end

  def public_gists_count
    user_info['public_gists']
  end

  def followers
    user_info['followers']
  end

  def following
    user_info['following']
  end

  def starred_repos_count
    starred_info.count
  end

  def bio
    user_info['bio']
  end

  def member_since
    date = DateTime.parse(user_info['created_at'])
    formatted_date = date.strftime('%b %d, %Y')
  end

  def location
    user_info['location']
  end
end

# {"login"=>"matthewrpacker",
#
#  "id"=>14930925,
#
#  "avatar_url"=>"https://avatars.githubusercontent.com/u/14930925?v=3",
#
#  "gravatar_id"=>"",
#
#  "url"=>"https://api.github.com/users/matthewrpacker",
#
#  "html_url"=>"https://github.com/matthewrpacker",
#
#  "followers_url"=>"https://api.github.com/users/matthewrpacker/followers",
#
#  "following_url"=>
#   "https://api.github.com/users/matthewrpacker/following{/other_user}",
#
#  "gists_url"=>"https://api.github.com/users/matthewrpacker/gists{/gist_id}",
#
#  "starred_url"=>
#   "https://api.github.com/users/matthewrpacker/starred{/owner}{/repo}",
#
#  "subscriptions_url"=>
#   "https://api.github.com/users/matthewrpacker/subscriptions",
#
#  "organizations_url"=>"https://api.github.com/users/matthewrpacker/orgs",
#
#  "repos_url"=>"https://api.github.com/users/matthewrpacker/repos",
#
#  "events_url"=>"https://api.github.com/users/matthewrpacker/events{/privacy}",
#
#  "received_events_url"=>
#   "https://api.github.com/users/matthewrpacker/received_events",
#
#  "type"=>"User",
#
#  "site_admin"=>false,
#
#  "name"=>nil,
#
#  "company"=>nil,
#
#  "blog"=>nil,
#
#  "location"=>nil,
#
#  "email"=>nil,
#
#  "hireable"=>nil,
#
#  "bio"=>nil,
#
#  "public_repos"=>25,
#
#  "public_gists"=>3,
#
#  "followers"=>2,
#
#  "following"=>0,
#
#  "created_at"=>"2015-10-01T19:42:46Z",
#
#  "updated_at"=>"2016-08-30T13:53:35Z"}
