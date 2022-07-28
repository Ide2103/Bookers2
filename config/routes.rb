Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about", to: 'homes#about', as: :about
  patch "books/:id", to: "books#update", as: :edit_book
  patch "users/:id", to: "users#update", as: :edit_user
  
  resources :books, only: [:index, :show, :edit, :create, :destroy]
  resources :users, only: [:index, :show, :edit,]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
