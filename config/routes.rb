Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'v1/login', to: 'login#new'
  post 'v1/login', to: 'login#login'
  
  # View Page
  get 'sets_page', to: 'record_sets#index', as: 'set_record'

  # Delete
  delete 'delete_record/:id', to: 'record_sets_delete#delete_record', as: 'delete_record'

  # Update 
  get 'edit_record/:id', to: 'record_sets_update#edit_record', as: 'edit_record'
  patch 'update_record/:id', to: 'record_sets_update#update_record', as: 'update_record'

  # patch 'record_sets/:id/update_record', to: 'record_sets_update#update_record', as: 'update_record'




  mount EndpointResource => '/'
end

