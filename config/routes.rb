Rails.application.routes.draw do
  # get 'comments/content:string'
  resources :products do
    resources :comments
  end
  devise_for :users
  root 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
