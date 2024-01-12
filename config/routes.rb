Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }
  resources :users

  resources :books
  resources :reviews
  resources :shops, only:[:index, :show]
  resources :transaction_items
  resources :transactions
  resource :carts, only:[:show]

  root 'shops#index'
  match "/users/create" => "users#create", as: "users_create", via: [:post]
  match "/users/update" => "users#update", as: "users_update", via: [:post, :put, :patch]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
