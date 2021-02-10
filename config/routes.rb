Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "items#index"
  resources :items do
    resources :purchases, only:[:index, :create]
  end
  resources :users, only: [:new]
end
