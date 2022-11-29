class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tasks = Task.is_available_for_application.where(user: @user)
  end
end
