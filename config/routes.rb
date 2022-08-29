Rails.application.routes.draw do
  devise_for :users
  resources :posts
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/search' => 'searches#search'
  get '/user' => 'posts#user'
  get '/user/posts' => 'posts#user_posts'
  root to: "searches#search"             
end
