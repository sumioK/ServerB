Rails.application.routes.draw do
  get "homes/top"
  get "/" => "homes#top"

  post "posts/create" => "posts#create"
  post "posts/destroy" => "posts#destroy"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/show" => "posts#show"

  get "users/new" => "users#new"
  post "users/create" => "users#create"
end
