Rails.application.routes.draw do
  get 'logouts/index', as: :logouts
  get 'dashboards/index', as: :dashboards
  resources :users, only: [:show]
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]
end
