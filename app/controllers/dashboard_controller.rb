class DashboardController < ApplicationController
  def show
    @github = GithubService.new(current_user)
    @user_info = UserInfo.new(@github.user_info)
    @github.starred_info
    @github.repos_info
    @github.activity_info
  end
end
