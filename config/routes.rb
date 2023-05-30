Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount EndpointResource => '/'
  post "view", to: "view_user_record#view"
  get "home", to: "view_user_record#index"

end
