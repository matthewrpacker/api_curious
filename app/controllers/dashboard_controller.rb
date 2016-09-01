class DashboardController < ApplicationController
  def show
    @github = GithubService.new(current_user)
  end
end
