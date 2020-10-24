Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # , controllers: { invitations: 'users/invitations' }
  resources :departments
  resources :users # , only: %i[index show edit update]
  # resources :users, controller: 'users'

  resources :development_plans

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
