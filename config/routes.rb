# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/:user_id/posts", to: "posts#index" # usually requires a view
  get "/users/:user_id/posts/:id", to: "posts#show" # usually requires a view
  get "/users", to: "users#index" # usually requires a view
  get "/users/:id", to: "users#show"  # usually a submitted form
end
