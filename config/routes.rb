Entitle::Application.routes.draw do
  # root :to => "images#new"

  resources :users do
    resources :images, only: [:new, :create, :show]
  end
end
