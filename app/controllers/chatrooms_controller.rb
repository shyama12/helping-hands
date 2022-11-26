class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
    @chatroom.users = [current_user, User.find(params[:chat_user])]
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    #@chatroom.user = current_user

    if @chatroom.save!
      redirect_to chatroom_path(@chatroom), notice: "Your chatroom has been added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chatroom_params

    params.require(:chatroom).permit(:name, :users)
  end
end
