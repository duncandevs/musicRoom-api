class RoomsController < ApplicationController
  # all the methods in this controller class will rely on having the host ready
  def index
    render json: "welcome to your rooms " + host.username
  end

  private

  def host
    Host.find(params[:host_id])
  end
end
