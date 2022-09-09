Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :clients
  devise_for :users, path_prefix: 'auth'
  get 'welcome/index'
  root 'welcome#index'
end
