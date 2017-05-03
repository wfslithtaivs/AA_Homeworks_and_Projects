Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :show]

  resources :bands do
    resources :albums, only: [:new]
    end

  resources :albums do
    resources :tracks, only: [:new, :index]
  end

  resources :tracks
end
