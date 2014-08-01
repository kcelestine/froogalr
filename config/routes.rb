Rails.application.routes.draw do

  # Welcome
  get "/" => 'welcome#index', as: root

  resources :users, except: [:index]
  resources :restaurants, only: [:index, :show]
  resources :reviews, except: [:show, :index]
  resources :favorites, except: [:show, :index, :destroy]

end
