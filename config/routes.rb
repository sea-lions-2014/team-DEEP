Entitle::Application.routes.draw do

  # root :to => "images#new"

  resources :users do
    resources :images, only: [:new, :create, :show]
  end

  resources :images do
    resources :captions, only: [:new, :create, :show]
  end
end
