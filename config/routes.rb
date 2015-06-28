Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [] do
    resources :projects
  end

  get '/users/profile', to: "users#show"

  root "dashboard#index"
end
