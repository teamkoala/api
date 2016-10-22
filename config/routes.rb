Rails.application.routes.draw do
  get 'items/query'

  get 'users', to: 'users#index'
  root to: 'users#index'
end
