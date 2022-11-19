Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tasks, only: [:index, :new, :create]
end
