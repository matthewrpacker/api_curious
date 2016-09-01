# class Repo
#   attr_reader :name, :html_url, :description, :updated_at
#
#   def initialize(hash)
#     @name = hash['name']
#     @html_url = hash['html_url']
#     @description = hash['description']
#     @updated_at = hash['updated_at']
#   end
#
#   def updated_at
#     date = DateTime.parse(@updated_at)
#     formatted_date = date.strftime('%b %d, %Y')
#   end
# end

class UserInfo
  # attr_reader
end

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
    @user_info_json = JSON.parse(response.body)
  end

  def starred_info
    response = @connection.get("/users/#{current_user.nickname}/starred")
    @starred_info_json = JSON.parse(response.body)
  end

  def repos_info
    response = @connection.get("/users/#{current_user.nickname}/repos")
    @repos_info_json = JSON.parse(response.body)
  end

  def repos
    @repos ||= @repos_info_json.map do |hash|
      Repo.new(hash)
    end
  end

  # def login_name
  #   @user_info_json['login']
  # end

  def name
    @user_info_json['name']
  end

  # def avatar_url
  #   @user_info_json['avatar_url']
  # end

  # def public_repos_count
  #   @user_info_json['public_repos']
  # end

  # def gists_url
  #   @user_info_json['gists_url']
  # end

  # def public_gists_count
  #   @user_info_json['public_gists']
  # end

  def followers
    @user_info_json['followers']
  end

  def following
    @user_info_json['following']
  end

  def starred_repos_count
    @starred_info_json.count
  end

  def bio
    @user_info_json['bio']
  end

  def member_since
    date = DateTime.parse(@user_info_json['created_at'])
    formatted_date = date.strftime('%b %d, %Y')
  end

  def location
    @user_info_json['location']
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




#REPOS

# [{"id"=>62648186,
#   "name"=>"active-record-sinatra",
#   "full_name"=>"matthewrpacker/active-record-sinatra",
#   "owner"=>
#    {"login"=>"matthewrpacker",
#     "id"=>14930925,
#     "avatar_url"=>"https://avatars.githubusercontent.com/u/14930925?v=3",
#     "gravatar_id"=>"",
#     "url"=>"https://api.github.com/users/matthewrpacker",
#     "html_url"=>"https://github.com/matthewrpacker",
#     "followers_url"=>"https://api.github.com/users/matthewrpacker/followers",
#     "following_url"=>
#      "https://api.github.com/users/matthewrpacker/following{/other_user}",
#     "gists_url"=>"https://api.github.com/users/matthewrpacker/gists{/gist_id}",
#     "starred_url"=>
#      "https://api.github.com/users/matthewrpacker/starred{/owner}{/repo}",
#     "subscriptions_url"=>
#      "https://api.github.com/users/matthewrpacker/subscriptions",
#     "organizations_url"=>"https://api.github.com/users/matthewrpacker/orgs",
#     "repos_url"=>"https://api.github.com/users/matthewrpacker/repos",
#     "events_url"=>
#      "https://api.github.com/users/matthewrpacker/events{/privacy}",
#     "received_events_url"=>
#      "https://api.github.com/users/matthewrpacker/received_events",
#     "type"=>"User",
#     "site_admin"=>false},
#   "private"=>false,
#   "html_url"=>"https://github.com/matthewrpacker/active-record-sinatra",
#   "description"=>nil,
#   "fork"=>true,
#   "url"=>"https://api.github.com/repos/matthewrpacker/active-record-sinatra",
#   "forks_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/forks",
#   "keys_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/keys{/key_id}",
#   "collaborators_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/collaborators{/collaborator}",
#   "teams_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/teams",
#   "hooks_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/hooks",
#   "issue_events_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/issues/events{/number}",
#   "events_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/events",
#   "assignees_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/assignees{/user}",
#   "branches_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/branches{/branch}",
#   "tags_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/tags",
#   "blobs_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/git/blobs{/sha}",
#   "git_tags_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/git/tags{/sha}",
#   "git_refs_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/git/refs{/sha}",
#   "trees_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/git/trees{/sha}",
#   "statuses_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/statuses/{sha}",
#   "languages_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/languages",
#   "stargazers_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/stargazers",
#   "contributors_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/contributors",
#   "subscribers_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/subscribers",
#   "subscription_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/subscription",
#   "commits_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/commits{/sha}",
#   "git_commits_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/git/commits{/sha}",
#   "comments_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/comments{/number}",
#   "issue_comment_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/issues/comments{/number}",
#   "contents_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/contents/{+path}",
#   "compare_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/compare/{base}...{head}",
#   "merges_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/merges",
#   "archive_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/{archive_format}{/ref}",
#   "downloads_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/downloads",
#   "issues_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/issues{/number}",
#   "pulls_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/pulls{/number}",
#   "milestones_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/milestones{/number}",
#   "notifications_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/notifications{?since,all,participating}",
#   "labels_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/labels{/name}",
#   "releases_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/releases{/id}",
#   "deployments_url"=>
#    "https://api.github.com/repos/matthewrpacker/active-record-sinatra/deployments",
#   "created_at"=>"2016-07-05T15:29:21Z",
#   "updated_at"=>"2016-07-05T15:29:21Z",
#   "pushed_at"=>"2016-07-06T03:59:09Z",
#   "git_url"=>"git://github.com/matthewrpacker/active-record-sinatra.git",
#   "ssh_url"=>"git@github.com:matthewrpacker/active-record-sinatra.git",
#   "clone_url"=>"https://github.com/matthewrpacker/active-record-sinatra.git",
#   "svn_url"=>"https://github.com/matthewrpacker/active-record-sinatra",
#   "homepage"=>nil,
#   "size"=>28,
#   "stargazers_count"=>0,
#   "watchers_count"=>0,
#   "language"=>"Ruby",
#   "has_issues"=>false,
#   "has_downloads"=>true,
#   "has_wiki"=>true,
#   "has_pages"=>false,
#   "forks_count"=>0,
#   "mirror_url"=>nil,
#   "open_issues_count"=>0,
#   "forks"=>0,
#   "open_issues"=>0,
#   "watchers"=>0,
#   "default_branch"=>"master"},
