class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      @chatroom_users = ChatroomUser.where(chatroom: @chatroom)
      @chatroom_users.each do |chatroom_user|
        chatroom_user.new_messages += 1 if chatroom_user.subscribed.zero?
        chatroom_user.save!
      end
      ChatroomChannel.broadcast_to(@chatroom,
                                   message: render_to_string(partial: "message",
                                                             locals: { message: @message }),
                                   sender_id: @message.user.id)
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
