Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:get, :update, :delete, :post, :create]

  get '/users/new(.:format)' => 'users#create'
  get '/users/edit(.:format)' => 'users#edit'
  get '/users(.:format)' => 'users#index'
  get 'users/:id(.:format)' => 'users#show'

  patch '/users(.:format)' => 'users#update'
  put '/users(.:format)' => 'users#update'
  delete '/users(.:format)' => 'users#destroy'
  post '/users(.:format)' => 'users#create'

end
