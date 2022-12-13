class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.is_available_for_application
    if params[:need].present? && !params[:can].present? && params[:query].present?
        @tasks = Task.is_available_for_application.where(category_id: params[:categories], city: params[:query], need_help: false)
    elsif params[:can].present? && !params[:need].present? && params[:query].present?
        @tasks = Task.is_available_for_application.where(category_id: params[:categories], city: params[:query], need_help: true)
    elsif params[:need].present? && !params[:categories].present? && !params[:query].present?
        @tasks = Task.is_available_for_application.where(need_help: false)
    elsif params[:can].present? && !params[:categories].present? && !params[:query].present?
        @tasks = Task.is_available_for_application.where(need_help: true)
    elsif params[:query].present? && !params[:can].present? && !params[:need].present? && !params[:categories].present?
        @tasks = Task.is_available_for_application.where(city: params[:query])
    elsif params[:need].present? && params[:query].empty? && params[:can].empty?
        @tasks = Task.is_available_for_application.where(category_id: params[:categories], need_help: false)
    elsif params[:can].present? && !params[:query].present? && !params[:need].present?
      @tasks = Task.is_available_for_application.where(need_help: true, category_id: params[:categories])
    else
        @tasks = Task.is_available_for_application
    end
    @markers = @tasks.geocoded.map do |task|
      {
        nH: task.need_help?,
        lat: task.latitude,
        lng: task.longitude,
        info_window: render_to_string(partial: "info_window", locals: { task: task })
      }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save!
      redirect_to task_path(@task), notice: "Your task has been added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @markers = [{ nH: @task.need_help?,
                  lat: @task.latitude,
                  lng: @task.longitude,
                  info_window: render_to_string(partial: "info_window", locals: { task: @task }) }]
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
    @tasks = Task.is_available_for_application.where(user: current_user)
    render :my_tasks
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:need_help, :category_id, :title, :description, :date_time, :address, :city)
  end
end
