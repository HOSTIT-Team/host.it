Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: [:show, :new, :create, :edit, :update, :destroy ]
  resources :dashboard, only: [:index]
  resources :users, only: [:show, :edit, :update, :new]
  resources :invitations, only: [:update]
end
