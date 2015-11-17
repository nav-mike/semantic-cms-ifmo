Rails.application.routes.draw do

  # Mongo
  mount MongodbLogger::Server.new, at: '/mongodb', as: :mongodb
  mount MongodbLogger::Assets.instance, at: '/mongodb/assets', as: :mongodb_assets

  # users
  devise_for :users, path: ''

  root 'layouts#index'

  scope 'admin/api', defaults: {format: :json} do
    resources :pages
    resources :users, except: :show
    resources :variables
    get '/variables/:id/exec' => 'variables#exec', constraints: {id: /[0-9]+/}
  end

  get '*path.html' => 'layouts#index', layout: :null
  get '*path' => 'layouts#index'

  # settings
  resources :settings, except: :show
  #
  # # pages
  # scope '/admin' do
  #   resources :pages, except: :show
  # end
  # resources :pages, only: :show
  #
  # # public pages
  # # get 'pages/index'
  # # get 'pages/abit'
  # # get 'pages/student'
  # # get 'pages/graduate'
  # # get 'pages/history'
  # # get 'pages/staff'
  # # get 'pages/contacts'
  # # /public pages
  #
  # get 'admin/index'
  # get 'admin' => 'admin#index'
  #
  # root 'pages#show'
  #
  # # debug cube
  # get '/admin/cube/project' => 'admin#project'
  # get '/admin/cube/person' => 'admin#person'
  # get '/admin/cube/department' => 'admin#department'
  # get '/admin/cube/search' => 'admin#search'
  # # end cube
  #
  # get '*page', to: 'pages#index'
end
