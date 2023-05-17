Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount EndpointResource => '/'
  
  root to: 'register_account#index'
  post '/register' => 'register_account#register'
  
end
