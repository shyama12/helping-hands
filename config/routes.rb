Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tasks, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :task_applications, only: [:create]
    collection do
      get :my_tasks
      get :my_applications
    end
  end
end
