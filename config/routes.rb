Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :properties, only: [:new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  get "/dashboard", to: 'pages#dashboard'

  resources :bookings, only: [] do
    resources :payments, only: :new
    
    resources :booking_tasks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    get "/match", to: 'pages#match'
    get "/success", to: 'pages#success'
    post "/payment", to: 'pages#payment'
  end
end

