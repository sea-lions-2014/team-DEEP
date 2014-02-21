Entitle::Application.routes.draw do

  root :to => "images#new"

  resources :images, only: [:new, :create, :show]
end
