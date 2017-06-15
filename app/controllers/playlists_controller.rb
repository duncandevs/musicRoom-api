class PlaylistsController < ApplicationController
  def index
    render json: "unauthorized playlists path"
  end

  def create
    playlist = Playlist.new(playlist_params)
    if playlist.valid?
      playlist.save
      render json: playlist
    else
      render json: playlist.errors.messages
    end
  end

  def show
    playlist = find_playlist
    if playlist
      render json: playlist
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:spotifyId, :user_id, :event_id, :embed_uri)
  end

  def find_playlist
    Playlist.find(params[:id])
  end
end
