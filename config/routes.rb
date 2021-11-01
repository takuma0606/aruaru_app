Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/search' => 'searches#search'
  get '/user' => 'posts#user'
  get '/user/posts' => 'posts#user_posts'
end
