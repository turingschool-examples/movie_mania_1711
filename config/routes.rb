Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/movies', to: "movies#index"
  root "welcome#index"

  resources :directors, shallow: true do
    resources :movies, param: :slug
  end

  resources :users, only: [:new, :create, :show]

  resources :awards, only: [:index, :show, :create]

  namespace :admin do
    resources :categories, only: [:index]
  end

  resources :carts, only: [:create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
