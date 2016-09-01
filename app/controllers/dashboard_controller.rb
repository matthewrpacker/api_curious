class DashboardController < ApplicationController
  def show
    @github = GithubService.new(current_user)
    @github.user_info
    @github.starred_info
    @github.repos_info
  end
end
