require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class LoginController < ApplicationController

  def index
  end

  def login

    email = params[:email].strip

    password = params[:password].strip

    uuid = SecureRandom.uuid

    login_user = LoginUser.new(uuid, email)

    user = User.find_by(email: email)

    begin

      if login_user.login(password)
        session[:user_id] = user.id
        # render 'homepage/index'
        redirect_to homepage_path
      end

    rescue NoUserError

      flash.now[:notice] = 'Wrong Email. Please try again'

      render :index

    rescue WrongPasswordError

      flash.now[:notice] = 'Wrong Password. Please try again'

      render :index
    
    end
  end
end

