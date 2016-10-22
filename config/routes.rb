Rails.application.routes.draw do
  patch 'orders/:id/finish', to: 'orders#finish'

  post 'line_items/create'

  get 'items/query'

  get 'users', to: 'users#index'
  root to: 'users#index'
end
