class TaskApplicationsController < ApplicationController
  def create
    @task_application = TaskApplication.new
    @task_application.user = current_user
    @task_application.task = Task.find(params[:task_id])
    @task_application.status = "open"
    @task_application.save!
    redirect_to tasks_path
  end
end
