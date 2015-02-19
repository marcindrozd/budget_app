Rails.application.routes.draw do
  root 'accounts#index'

  resources :accounts, only: [:show, :edit, :update] do
    resources :expenses
  end
  
end
