Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'login#new'

  # Routes for login_page related posts 
  post 'sign_up', to: "login#sign_up"
  post 'sign_in', to: "login#sign_in"
  post 'reset_password', to: "login#reset_password"
  patch 'reset_password', to: "login#update_password"

  # Routes for user actions
  post 'change_user_details', to: 'user#change_user_details'
  delete 'logout', to: "user#logout"

  # Routes for user navigations
  get 'user/profile'
  get 'user/calendar'

end
