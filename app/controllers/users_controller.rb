class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tasks = Task.is_available_for_application.where(user: @user)
    @experiences = Experience.joins(task_application: :task).where(tasks: { user: @user })
    @friendship_bracelets_count = @experiences.map(&:friendship_bracelet).size
    puts "fb count #{@friendship_bracelets_count}"
  end
end
