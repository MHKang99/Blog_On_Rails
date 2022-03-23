Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "posts#index"
  # routes for users
  resources :users
  # routes for session/sign in user
  get 'session/new', to: 'sessions#new'
  delete '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  # routes for posts and nested routes for comments
  resources :posts do
    resources :comments, only: [:destroy, :create]
  end
end
