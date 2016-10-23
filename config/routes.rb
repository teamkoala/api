Rails.application.routes.draw do
  get 'state', to: 'state#index'

  resources :orders, only: %i(index show new)

  get 'payments/index'

  patch 'orders/:id/finish', to: 'orders#finish'

  post 'line_items/create'

  get 'items/query'

  get 'health', to: 'users#index'
  get 'users', to: 'users#index'
  root to: 'users#index'
end
