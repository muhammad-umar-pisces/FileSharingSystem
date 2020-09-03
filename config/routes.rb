Rails.application.routes.draw do
  devise_for :users
  resources :filesystems do
  	resources :comments do
  		get :delete
  	end
  end
  resources :notifications
  get 'filesystems/my_file'
  root 'filesystems#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
