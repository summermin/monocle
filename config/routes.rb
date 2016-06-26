Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :projects do
    resources :check_ins, only: [:create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :twilio, only: [] do
        collection do
          post :sms_response
        end
      end
    end
  end

  get '/users/profile', to: "users#show"

  root "dashboard#index"
end
