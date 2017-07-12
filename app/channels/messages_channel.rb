class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'messages'
  end

  def receive(payload)
    message = Chatmsg.new(message: payload['content'])
    # message.user = User.first
    # message.chatroom = Chatroom.first
    # message.save
    ActionCable.server.broadcast('messages', message)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
