class ApplicationController < ActionController::API
  private
  def find_user
    User.find(params[:id])
  end

  def find_user_by_username(username)
    User.find_by(username: username)
  end
end
