Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'v1/login', to: 'login#new'
  post 'v1/login', to: 'login#login'
  
  get 'sets_page', to: 'record_sets#index'

  delete 'delete_record/:id', to: 'record_sets_delete#delete_record', as: 'delete_record'

  patch 'update_record/:id', to: 'record_sets_update#update_set_record', as: 'update_record'


  mount EndpointResource => '/'
end
