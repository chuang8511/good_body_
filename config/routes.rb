Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'login#index'
  post '/login', to: 'login#login'

  get '/homepage', to: 'homepage#index', as: 'homepage'

  get '/times_record_create', to: 'times_record_create#new', as: 'create_times_record'
  post '/times_record_create', to: 'times_record_create#create'



  get '/times_record', to: 'times_record_view#index', as: 'times_record'
  delete '/times_record/:id', to: 'times_record_delete#delete', as: 'delete_times_record'
  get '/times_record/:id/edit', to: 'times_record_update#edit', as: 'edit_times_record'
  patch '/times_record/:id', to: 'times_record_update#update', as: 'update_times_record'
  mount EndpointResource => '/'
end
