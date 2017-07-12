class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'messages'
  end

  def receive
    message = Chatmsg.new(content: payload['content'])
    # message.user = User.first
    # message.chatroom = Chatroom.first
    # message.save
    ActionCable.server.broadcast('messages', MessageSerializer.new(message))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
