Rails.application.routes.draw do
  resources :clients
  devise_for :users, path_prefix: 'auth'
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
