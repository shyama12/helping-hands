class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_new_messages

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :photo])
  end

  def set_new_messages
    @user_chatrooms = ChatroomUser.where(user: current_user)
    @new_messages = 0
    @user_chatrooms.each { |user_chatroom| @new_messages += user_chatroom.new_messages }
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
