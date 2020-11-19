Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users
  resources :groups
  resources :transactions


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
