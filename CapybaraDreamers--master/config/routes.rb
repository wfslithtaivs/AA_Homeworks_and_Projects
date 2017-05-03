Rails.application.routes.draw do

  resources :comments
  resources :posts
  resources :subs
  resources :users
  resource :session

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  # get 'users/new'
  #
  # get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
