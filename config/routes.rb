Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/create'
  patch "/requests/:id/accept", to: "requests#accept", as: 'accept'
  patch "/requests/:id/decline", to: "requests#decline", as: 'decline'

  resources :cakes do
    resources :requests, only: [:create, :new, :index]
  end
  resources :requests, only: [:destroy, :edit, :update, :show] do
    resources :messages, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard", as: 'dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
