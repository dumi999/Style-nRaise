Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  root to: "pages#home"
  get '/my_account', to: 'users#my_account'
  resources :listed_items

  # Routes for transactions
  get 'transactions', to: 'transactions#index'

  # Route for listing an item
  get 'list_item', to: 'listed_items#new'

  # Route for viewing items
  get 'my_items', to: 'listed_items#index'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
