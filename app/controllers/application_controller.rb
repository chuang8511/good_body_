class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def current_user
        #return unless session[:user_id]
        @current_user ||= session[:user_id]&&User.find(session[:user_id])
    end

    def index
    end
end