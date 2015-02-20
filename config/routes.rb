Rails.application.routes.draw do
  root 'home#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/register', to: "users#new"

  resources :accounts do
    resources :expenses do
      member do
        get 'done'
      end
    end

    post '/change_month', to: "accounts#change_month"
  end

  resources :users, only: [:create, :show, :update, :edit]
end
