Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  get '/users/:user_id/tasks/:id', to: 'tasks#checked'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :tasks, only: [:index, :create, :destroy]
  end
  resources :clients
end
