Rails.application.routes.draw do
  get '/user' => 'users#user'
  get 'users/my_posts'
  get 'users/my_posts/:id' => 'users#show'
  devise_for :users
  resources :posts do
    member do
      post :aruaru
      post :nainai
    end
  end
  resources :comments 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/search' => 'searches#search'
  get '/user/posts' => 'posts#user_posts'
  root to: "searches#search"             
end
