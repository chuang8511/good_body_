Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'v1/login', to: 'login#new'
  post 'v1/login', to: 'login#create'

  mount EndpointResource => '/'
end
