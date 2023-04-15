Rails.application.routes.draw do
  root 'homes#index'
  get 'logouts/index', as: :logouts
  get 'dashboards/index', as: :dashboards
  # get '/profile', to: 'users#index', as: :users
  resources :users, path: 'profile', only: %i[edit update destory index]
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]
end
