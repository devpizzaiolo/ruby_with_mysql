Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "sign_up", to:"registrations#new"
  post "sign_up", to:"registrations#create"
  post "sign_in", to:"registrations#login"
  get "sucess", to:"session#login"
  post "logined", to:"session#create"
  get "logined", to:"session#create"
  delete "logout", to:"session#destroy"
  # root to: "main#index"
end
