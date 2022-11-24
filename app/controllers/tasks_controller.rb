class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @markers = @tasks.geocoded.map do |task|
      {
        lat: task.latitude,
        lng: task.longitude,
        info_window: render_to_string(partial: "info_window", locals: { task: task })
      }
    end
  end

  def new
  end

  def create
  end
end
