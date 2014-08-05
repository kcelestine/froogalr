Rails.application.routes.draw do

  devise_for :users

  # Welcome
  get "/"                  => 'welcome#index', as: 'root'
  get '/search'            => 'restaurants#search'
  post '/favorite'         => 'users#add_favorite'
  post '/unfavorite'       => 'users#remove_favorite'

  resources :users, except: [:index]
  resources :restaurants, only: [:index, :show]
  resources :reviews, except: [:show, :index]
  resources :favorites, except: [:show, :index, :destroy]

end
