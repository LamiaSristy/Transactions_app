Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: %i[index]
  resources :groups, only: %i[index new create show edit update]
  resources :transactions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
