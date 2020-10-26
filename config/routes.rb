Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :departments
  resources :users
  resources :development_plans

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
