module V1

  class LoginApi < Grape::API

    resource :login do


      params do
        requires :email, type: String
        requires :password, type: String
      end

      post do

        uuid = SecureRandom.uuid

        login_user = LoginUser.new(uuid, params[:email])

        login_user.login(params[:password])

      end

    end


  end


end