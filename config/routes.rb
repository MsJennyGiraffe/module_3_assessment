Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :search, only: [:index]

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :items, only: [:index, :show, :create, :destroy]
    end
  end
end
