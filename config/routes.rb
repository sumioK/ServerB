Rails.application.routes.draw do
  get "homes/top"
  get "/" => "homes#top"

  post "posts/create" => "posts#create"
  post "posts/destroy" => "posts#destroy"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/show" => "posts#show"

  get "users/new" => "users#new"
  get "users/login_form" => "users#login_form"
  post "users/create" => "users#create"
  post "users/login" => "users#login"
end
