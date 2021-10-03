Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/search' => 'searches#search'
  get '/user' => 'users#user'
end
