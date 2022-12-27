Rails.application.routes.draw do
  get '/user' => 'users#user'
  get '/user/:id/posts', to: 'users#user_posts', as: 'user_posts'
  get 'users/my_posts'
  get 'users/my_posts/:id' => 'users#show'
  devise_for :users
  resources :posts do
    member do
      post :aruaru
      post :nainai
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :comments 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/search' => 'searches#search'
  root to: "searches#search"             
end
