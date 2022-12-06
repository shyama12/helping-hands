class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @tasks = Task.where("category_id: ILIKE :categories, city: ILIKE :query", categories: "%#{params[:categories]}%", query: "%#{params[:query]}")
    else
      @tasks = Task.all
    end
    @need_help_tasks = Task.where(need_help: true)
    @volunteer_tasks = Task.where(need_help: false)
  end
end
