class ChatroomsController < ApplicationController
  def index
    @chatroom_users = ChatroomUser.where(user: current_user)
    @chatrooms = @chatroom_users.map(&:chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom_users = ChatroomUser.where(chatroom: @chatroom)
    @users = @chatroom_users.map(&:user)
    @user_permitted = @users.include? current_user
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
    @chatroom.users = [current_user, User.find(params[:chat_user])]
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save!
      redirect_to chatroom_path(@chatroom), notice: "Your chatroom has been added"
    else
      render :new, status: :unprocessable_entity
    end
    #@chatroom.user = current_user
    @chatroom_user_sender = ChatroomUser.new(chatroom: @chatroom, user: current_user)
    @chatroom_user_receiver = ChatroomUser.new(chatroom: @chatroom, user: User.find(params[:chatroom][:chat_user]))
    @chatroom_user_sender.save!
    @chatroom_user_receiver.save!
  end

  private

  def chatroom_params

    params.require(:chatroom).permit(:name, :users)
  end
end
