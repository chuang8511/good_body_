Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'login#new'
  post 'login', to: 'login#login'
  
  # Homepage
  get '/homepage', to: 'homepage#homepage', as: 'homepage'

  
  
  # View Page
  get 'sets_page', to: 'record_sets#index', as: 'set_record'

  # Create
  get 'v1/record_sets_create', to: 'record_sets_create#new', as: 'create_sets_record'
  post 'v1/record_sets_create', to: 'record_sets_create#create'

  # Delete
  delete 'delete_record/:id', to: 'record_sets_delete#delete_record', as: 'delete_record'

  # Update 
  get 'edit_record/:id', to: 'record_sets_update#edit_record', as: 'edit_record'
  patch 'update_record/:id', to: 'record_sets_update#update_record', as: 'update_record'

  mount EndpointResource => '/'
end

