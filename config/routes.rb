Rails.application.routes.draw do
  root to: "user#index"
  # get 'users/:id', to: 'users#show'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'

  resources :user, :only => [:show, :edit, :update ]
  resources :user, :controller => "users"

  resources :departments
  # resource :user
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
