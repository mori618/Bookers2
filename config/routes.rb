Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :destroy, :show, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
  root to:  "homes#top"
  get '/home/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
