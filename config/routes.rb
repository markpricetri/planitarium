Rails.application.routes.draw do
  devise_for :users
  root 'shows#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shows, only: [:show, :index, :new, :create]

  resources :users, only: [:show, :edit, :update]
end
