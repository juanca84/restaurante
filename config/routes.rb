Rails.application.routes.draw do
  resources :detalle_pedidos
  resources :pedidos do
    member do
      get :atender
    end
  end
  resources :menus
  resources :clientes
  resources :mesas
  resources :restaurantes
  root to: 'restaurantes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :menus, only: :index
    end
  end
end
