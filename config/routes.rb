Rails.application.routes.draw do
  resources :shifts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # USER NOT PRESENT
  # Defines the root path route ("/")
  root 'login#new'

  # Routes for login_page related actions 
  post 'sign_up', to: "login#sign_up"
  post 'sign_in', to: "login#sign_in"
  post 'reset_password', to: "login#reset_password"
  patch 'reset_password', to: "login#update_password"
  get 'reset_password', to: "login#reset_password"

  # USER PRESENT
  # Routes for user actions
  post 'change_user_details', to: 'user#change_user_details'
  delete 'logout', to: "user#logout"

  # Routes for user navigations
  get 'user/profile', to: "profile#profile"
  get 'user/calendar', to: "calendar#calendar"

  # Admin routes
  namespace :admin do
    # Get all teams as default
    root 'teams#teams'
    get '/teams', to:"teams#teams"

    # Routes for editing teams
    post '/create_team', to:"teams#create_team"
    post '/update_team', to:"teams#update_team"
    delete '/delete_team/:id', to:"teams#destroy_team", as: "delete_team"

    # Routes surrounding showing (reading) teams
    get '/teams/:id', to: 'teams#show', as: 'team'
    get '/create_team', to:"teams#team_form"

  end
end
