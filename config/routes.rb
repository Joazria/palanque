Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :candidates, only: [:show, :edit, :update] do
    resources :favorites, only: :create
  end

  resources :favorites, only: :destroy

  get '/profile', to: 'pages#profile'

end
