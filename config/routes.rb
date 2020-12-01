Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: [:show, :new, :create, :edit, :update, :destroy ] do
    resources :invitations, only: [:index, :create, :destroy]
    resources :items, only: [:index, :new, :create]
    resources :messages, only: :create
  end
  resources :items, only: :update
  resources :dashboard, only: [:index]
  resources :users, only: [:show, :edit, :update, :new]
  resources :invitations, only: [:update]
<<<<<<< HEAD
  resources :messages, only: [:destroy]
  get '/auth/spotify/callback', to: 'users#spotify'
end
=======
  resources :messages, only: :destroy
end
>>>>>>> main
