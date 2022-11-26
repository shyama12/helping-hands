Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tasks, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get :my_tasks
    end
  end
  resources :chatrooms, only: [:new, :create, :show] do
    resources :messages, only: :create
  end
end
