class UsersController < ApplicationController
  def index
    render json: "unauthorized path"
  end

  def create
    user = User.new(user_params)
    user.password = params[:password]
    if user.valid?
      user.save
      render json: user
    else
      render json: user.errors.messages
    end
  end

  def show
    user = find_user
    if user
      render json: user
    end
  end

  def update
    user = find_user
  end

  def set_profileId
    user = User.find(params[:id])
    user.profileId = params[:profileId]
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
