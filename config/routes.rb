Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount EndpointResource => '/'
  
  root to: 'register_account#index'
  post '/submit' => 'register_account#submit'

  get "home", to: "register_account#show"
  get "personal_profile", to: "register_account#personal_profile"

  get "update", to: "register_account#update"
  post "update_action", to: "register_account#update_action"

  
end
