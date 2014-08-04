Rails.application.routes.draw do

  # Welcome
  get "/"               => 'welcome#index', as: 'root'
  get   '/login'        => 'sessions#new'
  post  '/sessions'     => 'sessions#create'
  get   '/logout'       => 'sessions#destroy'

  resources :users, except: [:index]
  resources :restaurants, only: [:index, :show]
  resources :reviews, except: [:show, :index]
  resources :favorites, except: [:show, :index, :destroy]

end
