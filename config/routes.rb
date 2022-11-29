Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tasks, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :task_applications, only: [:create]
    collection do
      get :my_tasks
    end
  end

  resources :task_applications, only: [:index] do
    collection do
      get :applications_to_me
    end
    member do
      patch :accept
      patch :reject
    end
  end

  resources :chatrooms, only: [:new, :create, :show] do
    resources :messages, only: :create
  end

  resources :users do
    member do
      get :profile
    end
  end
end
