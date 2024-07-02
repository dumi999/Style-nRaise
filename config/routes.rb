Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # Custom user account route
  get '/my_account', to: 'users#my_account'

  # Listed items routes
  resources :listed_items do
    collection do
      get 'my_items'
    end
  end

  # Route for transactions
  resources :transactions, only: [:index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
