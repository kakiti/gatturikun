Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :users, only: [:index, :show] do
    resources :tasks, only: [:index, :new, :create, :destroy]
  end
  resources :clients
end
