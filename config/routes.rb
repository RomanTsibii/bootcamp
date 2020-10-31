require 'sidekiq/web'


Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'

  get 'home/dashboard'

  devise_for :users, controllers: { invitations: 'users/invitations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :departments
  resources :users
  resources :development_plans do
    resources :flow_steps, except: %i[show]
    resources :tasks
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
