Rails.application.routes.draw do
  devise_for :users
  resources :filesystems do
  	resources :comments
  end
  resources :notifications
  root 'filesystems#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
