Rails.application.routes.draw do
  resources :detalle_pedidos
  resources :pedidos
  resources :menus
  resources :clientes
  resources :mesas
  resources :restaurantes
  root to: 'restaurantes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
