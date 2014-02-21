Entitle::Application.routes.draw do
  root to: "guests#index"

  resources :users do
    resources :images, only: [:new, :create, :show]
  end

  resources :images, only: :show
end
