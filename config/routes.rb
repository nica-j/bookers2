Rails.application.routes.draw do
  get 'books/show'
  get 'books/index'
  get 'books/edit'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
