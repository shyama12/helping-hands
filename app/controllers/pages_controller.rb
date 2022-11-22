class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tasks = Task.all
    @need_help_tasks = Task.where(need_help: true)
    @volunteer_tasks = Task.where(need_help: false)
  end
end
