Rails.application.routes.draw do
  patch "/requests/:id/accept", to: "requests#accept", as: 'accept'
  patch "/requests/:id/decline", to: "requests#decline", as: 'decline'

  resources :cakes do
    resources :requests, only: [:create, :new, :index]
  end
  resources :requests, only: [:destroy, :edit, :update, :show]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
