Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :posts, only: [:index, :create]
      get 'users/:id/liked_posts', to: 'users#liked_posts'
      post '/login', to: 'users#login'
      post '/signup', to: 'users#create'
    end
  end
end
