Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: 'pages#dashboard'
  resources :properties, only: [:new, :create]

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end
end
