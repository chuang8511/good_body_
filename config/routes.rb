Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount EndpointResource => '/'
  get "personal_profile", to: "view_user_record#view"

end
