class SpotifysController < ApplicationController
  def index
    render json: Spotify.find_by(user_id:params[:user_id])
  end
  def create
    render json: Spotify.find_or_create_by(user_id:params[:user_id],spotifyUserId:params[:spotifyUserId])
  end
end
