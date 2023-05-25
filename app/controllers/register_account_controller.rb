require 'net/http'
require 'json'
class RegisterAccountController < ApplicationController

    def index
        
    end

    def submit
        @register_account_user = RegisterAccountUser.new(params[:account],params[:password],params[:name],params[:email],params[:phone_number],params[:age],params[:gender],params[:height],params[:weight])
        if @register_account_user.create_account
        # 成功
          session[:account] = params[:account]
          render :show
        else
        # 失敗
          render :index
      end
    end

    def personal_profile
        #render plain: "<h1>你好，世界!</h1>"
        user = User.find_by(account: session[:account] )
        @weight = user.weight 
        @height = user.height
        @age = user.age  
        @gender = user.gender
    end

    def update
        #p session[:account] 
    end

    def update_action
        info_ident = InfoIdentification.new()
        user = User.find_by(account: session[:account] )

        if (user.nil?)   #testify the existance of the account
          #
        else  #personal info. delivery
          weight = info_ident.weight_testify(params[:weight_modified].to_i)
          height = info_ident.height_testify(params[:height_modified].to_i)
          age =    info_ident.age_testify(params[:age_modified].to_i)
          gender = params[:gender_modified]
          user.update!(height: height,weight: weight,age: age,gender: gender)
          render :show
        end
    end

    def wrong_height
      #
    end

    def show
      #
    end

end