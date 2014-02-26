Entitle::Application.routes.draw do

  root to: "images#index"

  resources :users, :except => [:index]  do
    resources :images, only: [:new, :create, :show]
  end

  resources :images, only: :show do
    resources :captions, only: [:new, :create, :show]
  end

  resource :sessions, :only => [:new, :create, :destroy]

  get '/login' => 'sessions#new', :as => :login

  delete '/logout' => 'sessions#destroy', :as => :logout

  put '/images/:image_id/captions/:id/vote_up' => 'captions#vote_up', :as => 'vote_up_caption'
end
