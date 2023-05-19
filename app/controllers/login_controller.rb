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

    begin

      if login_user.login(password)
        session[:account] = params[:account]
        render :homepage
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

