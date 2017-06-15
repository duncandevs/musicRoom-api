class LoginController < ApplicationController
  def index
    user = find_user_by_username(params[:username])
      if user.present? && user.authenticate(params[:password])
        render json: {
          account: {
            username: user.username,
            id: user.id
          }
        }
      else
        render json: {error: 'username or password not found'}
      end
  end

end
