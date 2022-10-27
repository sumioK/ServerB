Rails.application.routes.draw do
  get "homes/top"
  get "/" => "homes#top"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/show" => "posts#show"

  get "users/new" => "users#new"
  post "posts/create" => "posts#create"
end
