Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/v1/login', to: 'login#index'
  post '/v1/login', to: 'login#login'

  get '/v1/times_record', to: 'times_record#index', as: 'times_record'
  delete '/v1/times_record', to: 'times_record#delete'
  mount EndpointResource => '/'
end
