Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :summer_houses, except: [:edit, :update]
  # route for user show page
  get "users/:id", to: "users#show"
end
