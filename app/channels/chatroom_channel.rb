class ChatroomChannel < ApplicationCable::Channel
  before_subscribe :set_subscribed_flag_and_new_messages
  before_unsubscribe :set_subscribed_flag

  def subscribed
    # stream_from "some_channel"
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def set_subscribed_flag_and_new_messages
    current_user = User.find(params[:user])
    chatroom = Chatroom.find(params[:id])
    chatroom_user = ChatroomUser.where(chatroom: chatroom, user: current_user)
    chatroom_user.update!(subscribed: 1)
    chatroom_user.update!(new_messages: 0)
  end

  def set_subscribed_flag
    current_user = User.find(params[:user])
    chatroom = Chatroom.find(params[:id])
    chatroom_user = ChatroomUser.where(chatroom: chatroom, user: current_user)
    chatroom_user.update!(subscribed: 0)
  end
end
