Rails.application.routes.draw do
  devise_for :users
  resources :databases
  # get 'home/index'
  get 'home/about'
  root 'databases#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
