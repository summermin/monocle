Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [] do
    resources :projects, only: [:new, :create, :update, :destroy]
  end

  get '/users/profile', to: "users#show"
  get '/projects', to: 'projects#index'

  root "dashboard#index"
end
