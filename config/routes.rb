Rails.application.routes.draw do
  resources :movie_categories
  resources :actor_movies
  resources :movies
  resources :addresses
  resources :categories
  resources :actors
  resources :directors

  get "persons/new" => "people#new"
  post "persons" => "people#create"
  get '/persons' => 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
