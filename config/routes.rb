Rails.application.routes.draw do
  root to: "user#index"

  resources :user, :only => [:show, :edit, :update ]
  resources :user, :controller => "users"
  resources :departments
  resources :development_plans

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
