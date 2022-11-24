class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save!
      redirect_to tasks_path, notice: "Your task has been added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Your task has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def my_tasks
    @tasks = Task.where(user: current_user)
    render :index
  end

  def my_applications
    @tasks_applications = TaskApplication.where(user: current_user)
    @tasks = @task_application.map(&:task) unless @task_application.nil? || @task_application.size.zero?
    render :index
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:need_help, :category_id, :title, :description, :date_time, :address)
  end
end
