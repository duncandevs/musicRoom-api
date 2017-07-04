class DevicesController < ApplicationController
  def index
    render json: Device.find_by(user_id:params[:user_id])
  end
  def create
    render json: Device.find_or_create_by(user_id:params[:user_id],deviceId:params[:deviceId])
  end
end
