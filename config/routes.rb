Rails.application.routes.draw do
  post 'line_items/create'

  get 'items/query'

  get 'users', to: 'users#index'
  root to: 'users#index'
end
