Rails.application.routes.draw do
  # users
  devise_for :users
  resources :users

  # public pages
  get 'pages/index'
  get 'pages/abit'
  get 'pages/student'
  get 'pages/graduate'
  get 'pages/history'
  get 'pages/staff'
  get 'pages/contacts'
  # /public pages

  get 'admin/index'

  root 'pages#index'

  mount MongodbLogger::Server.new, at: '/mongodb', as: :mongodb
  mount MongodbLogger::Assets.instance, at: '/mongodb/assets', as: :mongodb_assets
end
