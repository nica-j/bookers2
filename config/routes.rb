Rails.application.routes.draw do
  # get 'books/show'
  # get 'books/index'
  # get 'books/edit'
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  get 'homes/top'
  get 'home/about' => 'homes#about' , as: 'about'
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
