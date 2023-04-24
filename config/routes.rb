Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  get '/about' => 'homes#about'

  resources :users, only: [:show, :edit, :update]
  resources :events, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :tasks, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :diaries, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
