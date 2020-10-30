require 'sidekiq/web'


Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'users#index'

  devise_for :users, controllers: { invitations: 'users/invitations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :departments
  resources :users
  resources :development_plans do
    resources :flow_steps
  end
  resources :flow_steps do
    resources :tasks
  end
  resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
