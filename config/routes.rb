Rails.application.routes.draw do
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  resources :books, only: [:new, :create, :index, :show, :edit]
  devise_for :users
  root to:  "homes#top"
  get '/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
