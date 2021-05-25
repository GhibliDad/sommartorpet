Rails.application.routes.draw do
  devise_for :users
  root to: 'summer_houses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :summer_houses, except: [:index, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :destroy]
  # route for user show page
  get "users/:id", to: "users#show"
end
