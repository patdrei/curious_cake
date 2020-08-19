Rails.application.routes.draw do
  resources :cakes do
    resources :requests, only: [:create, :new, :index]
  end
  resources :requests, only: [:destroy, :edit, :update, :show]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
