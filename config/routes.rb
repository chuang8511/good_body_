Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'v1/login', to: 'login#index'
  post 'v1/login', to: 'login#login'
  mount EndpointResource => '/'
end
