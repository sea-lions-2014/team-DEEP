Entitle::Application.routes.draw do
  root to: "guests#index"

  resources :users  do
    resources :images, only: [:new, :create, :show]
  end
  resource :sessions, :only => [:new, :create, :destroy]
  resources :images, only: :show
  get '/login' => 'sessions#new', :as => :login
  delete '/logout' => 'sessions#destroy', :as => :logout
end
