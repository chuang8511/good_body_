Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/v1/login', to: 'login#index'
  post '/v1/login', to: 'login#login'

  # get '/v1/times_record_view', to: 'times_record_view#index', as: 'times_record'
  # delete '/v1/times_record_delete', to: 'times_record_delete#delete'
  # get '/v1/times_record/:id/edit', to: 'times_record#edit', as: 'edit_times_record'
  # patch '/v1/times_record/:id', to: 'times_record#update', as: 'update_times_record'

  get '/v1/times_record', to: 'times_record_view#index', as: 'times_record'
  delete '/v1/times_record/:id', to: 'times_record_delete#delete', as: 'delete_times_record'
  get '/v1/times_record/:id/edit', to: 'times_record_update#edit', as: 'edit_times_record'
  patch '/v1/times_record/:id', to: 'times_record_update#update', as: 'update_times_record'
  mount EndpointResource => '/'
end
