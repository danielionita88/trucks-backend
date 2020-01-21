Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :posts, only: [:index, :create, :show, :destroy]
      resources :likes, only: [:create, :destroy]
      get 'users/:id/liked_posts', to: 'users#liked_posts'
      get 'users/:id/posts', to: 'users#posts'
      post '/login', to: 'users#login'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'users#show'
      get '/google_maps', to: 'posts#google_maps'
      delete '/likes/:user_id/:post_id', to: 'likes#remove_like'
    end
  end
end
