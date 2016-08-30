class HomeController < ApplicationController
  def index
  end

  def auth_failure
    flash[:notice] = params[:message]
    redirect_to root_path
  end
end
