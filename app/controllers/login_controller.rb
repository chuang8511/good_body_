require 'uri'
require 'net/http'

class LoginController < ApplicationController

  def index
  end

  def login
    uri = URI("http://localhost:3000/v1/login")
    response = Net::HTTP.post_form(uri, email: params[:email], password: params[:password])

    if response.code == "200"
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
      render :index
    end
  end
end