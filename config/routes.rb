Rails.application.routes.draw do
  get "homes/top"
  get "/" => "homes#top"

  post "posts/create" => "posts#create"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"

  post "/signup" => "users#create"
  get "/signup" => "users#new"
  get "/login" => "users#login_form"
  post "/login" => "users#login"
  post "/logout" => "users#logout"
end
