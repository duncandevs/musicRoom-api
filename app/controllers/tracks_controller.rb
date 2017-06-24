class TracksController < ApplicationController
  def index
    tracks = Track.all
    render json: tracks
  end
  def create
    album = find_or_create_album(params[:album])
    track = Track.new(tracks_params)
    track.event = Event.find(params[:event_id])
    track.album_id = album.id
    if track.valid?
      track.save
      render json: track
    end
  end

  def show
    render json: Track.find(params[:id])
  end

  def vote
    track = Track.find(params[:id])
    user = User.find(params[:user])
    if user
      vote = find_or_create_vote(track,user)
      vote.vote = true
      vote.save
      render json: track
    end
  end

  def unvote
    track = Track.find(params[:id])
    user = User.find(params[:user])
    if user
      vote = Vote.find_by(track_id:track.id)
      vote.vote = false
      vote.save
      render json: track
    end
  end

  def event
    tracks = Track.where(event_id:params[:event_id])
    render json: tracks
  end

  private

  def tracks_params
    params.require(:track).permit(:name, :artist, :cover, :uri,:status,:album,:event_id)
  end

  def album_params
    params.require(:album).permit(:name,:uri,:image)
  end

  def find_or_create_album(params)
    Album.find_or_create_by(uri: params['uri']) do |album|
      album.uri = params['uri']
      album.image = params['image']
      album.name = params['name']
    end
  end

  def find_or_create_vote(track,user)
    Vote.find_or_create_by(track_id: track.id, user_id: user.id) do |vote|
      vote.track_id = track.id
      vote.user_id = user.id
    end
  end

end
