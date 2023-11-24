Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :res_tfuls
  devise_for :users
=======
>>>>>>> 50c0ef674d44b1aa17b0bd909732ae649c269889
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :likes, only: [:create]
      resources :comments, only: [:new, :create] 
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
