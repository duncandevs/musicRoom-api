class EventsController < ApplicationController
  def index
    events = Event.where(host_id: params[:user_id])
    render json: events
  end

  def create
    event = Event.new(event_params)
    #  TODO: create assocaited playlist
    # event.build_playlist(playlist_params)
    event.host_id = params[:user_id]
    if event.valid?
      event.invite_code = Event.generate_code
      event.save
      render json: event
    else
      render json: 'event create error'
    end
  end

  def show
    event = find_event
    render json: event
  end

  # TODO: def invite , controller action for invited users

  def invite
    # will get invite code from params and then find event
  end

  def find_event_by_invite
    guest = create_guest
    guest.save
    event = Event.find_by(invite_code: params[:inviteCode])
    if event
      render json: {eventId: event.id, user: guest}
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :user_id)
  end

  def find_event
    Event.find_by(id: params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end

  def create_guest
    user = User.new
    user.username = params[:username]
    user.name = params[:username]
    user.password = 'null'
    user.guest = true
    user
  end

  # TODO: add strong params
  # def playlist_params
  #
  # end
end
