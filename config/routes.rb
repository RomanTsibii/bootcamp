Rails.application.routes.draw do
  root to: 'users#index'

  resources :departments do
    resources :users, only: %i[show edit update]
    resources :users, controller: 'users'
  end

  resources :development_plans

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
