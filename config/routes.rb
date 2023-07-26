Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'samples/:action', controller: 'samples'

  resources :clients
  resources :users do
    get :confirm, on: :member
    get :invite, on: :member
    get :login_as, on: :member
  end
  devise_for :users, path_prefix: 'auth'
  get 'welcome/index'
  root 'welcome#index'
end
