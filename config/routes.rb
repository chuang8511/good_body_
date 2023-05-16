Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "personal_profile", to: "home#personal_profile"
  #get "hello/register_account", to: "home#register_account"
  mount EndpointResource => '/'
=begin
  resources :posts
  resources :users
  namespace :api do
    namespace :v1 do
      #resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :name, :account, :password, :phone_number, :height, :weight, :age, :email, :gender
      # 原文有 microposts, 我们现在把它注释掉
      # resources :microposts, only: [:index, :create, :show, :update, :destroy]
    end
  end
=end
end
