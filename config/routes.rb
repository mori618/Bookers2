Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :destroy, :show, :edit]
  resources :users, only: [:show, :edit, :update]

  devise_for :users
  root to:  "homes#top"
  get '/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
