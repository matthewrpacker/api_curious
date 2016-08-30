class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    session[:user_id] = auth.uid
    current_user.username = auth.info.nickname
    response = Faraday.get "https://api.github.com/users/#{auth.info.nickname}?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}"

    redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
