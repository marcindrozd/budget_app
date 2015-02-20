Rails.application.routes.draw do
  root 'home#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/register', to: "users#new"

  resources :accounts do
    resources :expenses, except: [:show] do
      member do
        get 'done'
      end
    end
  end

  resources :users, only: [:create, :show, :update, :edit]
end
