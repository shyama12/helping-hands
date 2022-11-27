class TaskApplicationsController < ApplicationController
  before_action :set_task_application, only: [:accept, :reject]
  def create
    @task_application = TaskApplication.new
    @task_application.user = current_user
    @task_application.task = Task.find(params[:task_id])
    @task_application.status = "open"
    @task_application.task.available = false
    @task_application.task.save!
    @task_application.save!
    redirect_to task_applications_path, notice: "You have applied for the task"
  end

  def index
    @task_applications = TaskApplication.where(user: current_user)
  end

  def applications_to_me
    @task_applications = TaskApplication.joins("JOIN tasks ON task_applications.task_id = tasks.id")
                                        .where(tasks: { user: current_user })
    render :applications_to_me
  end

  def accept
    @task_application.status = "accepted"
    @task_application.save!
    @task_applications = TaskApplication.joins("JOIN tasks ON task_applications.task_id = tasks.id")
                                        .where(tasks: { user: current_user })
    message = @task_application.task.need_help? ? "You have accepted help from " : "You have offered to help "
    redirect_to applications_to_me_task_applications_path, notice: "#{message} #{@task_application.user.first_name} #{@task_application.user.last_name}"
  end

  def reject
    @task_application.status = "rejected"
    @task_application.save!
    @task_applications = TaskApplication.joins("JOIN tasks ON task_applications.task_id = tasks.id")
                                        .where(tasks: { user: current_user })
    message = @task_application.task.need_help? ? "You have declined help from " : "You declined to offer help to "
    redirect_to applications_to_me_task_applications_path, notice: "#{message} #{@task_application.user.first_name} #{@task_application.user.last_name}"
  end

  private

  def set_task_application
    @task_application = TaskApplication.find(params[:id])
  end
end
