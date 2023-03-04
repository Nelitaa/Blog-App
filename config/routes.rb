Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :users
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
