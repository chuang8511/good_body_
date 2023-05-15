class LoginController < ApplicationController

  def index
  end

  def login

    response = ApiCaller.call_api('post', '1','login', { email: params[:email], password: params[:password] })

    if response[:code] == 200
      redirect_to root_url, notice: "Logged in!"
      
    else
      flash.now[:error] = "Email or password is invalid. #{response}"
      render :index
    end

  end
end

