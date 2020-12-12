Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  root to: 'pages#home'

  resources :properties, only: [:new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  get "/dashboard", to: 'pages#dashboard'


  resources :bookings, only: [:show] do
    resources :payments, only: :new
    resources :booking_tasks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    resources :booking_logs, only: [] do
      collection do
        post "/checkin", to: 'booking_logs#checkin'
        put "/checkout", to: 'booking_logs#checkout'
      end
    end
    get "/match", to: 'pages#match'
    get "/success", to: 'pages#success'
    post "/payment", to: 'pages#payment'

    resources :chatrooms, only: :show
  end


  resources :chatrooms, only: :index do
    resources :messages, only: :create
  end
end
