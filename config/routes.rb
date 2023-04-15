Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :users, only: [:show, :edit]
  resources :tasks, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
