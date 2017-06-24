class ChatmsgsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.chatmsgs
  end

  def create
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    if user && event
      chatmsg = Chatmsg.create(chatmsg_params)
      if event
        render json: chatmsg
      end
    end
  end

  def show
    chatmsg = Chatmsg.find_by(event_id:params[:id])
    render json: chatmsg
  end

  private

  def chatmsg_params
    params.require(:chatmsg).permit(:message,:event_id,:user_id)
  end

end
