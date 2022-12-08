class ExperiencesController < ApplicationController
  before_action :set_task_application, only: [:new, :create]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.task_application = @task_application
    if @experience.save!
      redirect_to profile_user_path(@experience.task_application.task.user), notice: "Your have left a comment for #{@experience.task_application.task.user.first_name} #{@experience.task_application.task.user.last_name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_task_application
    @task_application = TaskApplication.find(params[:task_application_id])
  end

  def experience_params
    params.require(:experience).permit(:comment, :friendship_bracelet)
  end
end
