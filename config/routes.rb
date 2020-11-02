require 'sidekiq/web'


Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'

  get 'home/dashboard'
  get 'home/send_pdf_to_mail'

  devise_for :users, controllers: { invitations: 'users/invitations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :departments do
    get 'send_pdf_to_mail'
  end
  resources :users
  resources :development_plans do
    resources :flow_steps, except: %i[show]
    resources :tasks do
      resources :comments
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
