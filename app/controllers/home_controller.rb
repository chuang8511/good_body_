class HomeController < ApplicationController

    before_action :current_user, only:[:personal_profile]

    # disable the CSRF token
    protect_from_forgery with: :null_session

    # disable cookies (no set-cookies header in response)
    # before_action :destroy_session

    # disable the CSRF token
    skip_before_action :verify_authenticity_token


    def personal_profile
        #render plain: "<h1>你好，世界!</h1>"
        user = User.find_by(account: session[:user_account] )
        @weight = user.weight 
        @height = user.height
        @age = user.age  
        @gender = user.gender
    end

    def register_account
        #request.session_options[:skip] = true
        #render { "name": params[:name],"account": params[:account],"password": params[:password],"phone_number": params[:phone_number],"height": params[:height],"weight": params[:weight],"age": params[:age],"email": params[:email],"gender": params[:gender] } 
    end

end