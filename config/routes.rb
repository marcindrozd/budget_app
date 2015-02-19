Rails.application.routes.draw do
  root 'accounts#index'

  resources :accounts, only: [:show, :edit, :update] do
    resources :expenses

    post '/change_month', to: "accounts#change_month"
  end
  
end
