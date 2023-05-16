require 'net/http'
require 'json'
class RegisterAccountController < ApplicationController

    def index
        
    end


    def submit
        @register_account_user=RegisterAccountUser.new(params[:account],params[:password],params[:name],params[:email],params[:phone_number],params[:age],params[:gender],params[:height],params[:weight])
        

        if @register_account_user.create_account
        # 成功
          session[:account]=params[:account]
          render :show
        else
        # 失敗
          render :index
      end
    end
=begin
    private
    def user_params
      params.require(:user).permit(:account,:email,:password,:name,:phone_number,:gender, :age, :height, :weight)
    end
=end
end