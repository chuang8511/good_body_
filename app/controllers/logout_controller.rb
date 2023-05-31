require 'uri'
require 'net/http'

class LogoutController < ApplicationController

    def logout
        session[:user_id] = nil
        session[:account] = nil
        redirect_to login_path, notice: 'Logged out successfully.'
    end

end