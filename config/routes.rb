Rails.application.routes.draw do
  root 'notices#index'
  resources :notices
get '/registration', to: "users#new"
post '/registration', to: "users#create", as: "registration_user"
get '/login', to: "users#login_form", as: "login"
post '/login', to: "users#login", as: "login_user"
get '/dashboard/:id', to: "users#dashboard", as: "dashboard"
delete '/logout', to: "users#logout", as: "logout_user"
resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
