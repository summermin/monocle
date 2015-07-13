Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :projects do
    resources :check_ins, only: [:create, :destroy]
  end

  get '/users/profile', to: "users#show"

  root "dashboard#index"
end
