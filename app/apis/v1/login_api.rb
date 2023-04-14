module V1 # define a module named V1
    class LoginApi < Grape::API # define a class name LoginApi that inherits from Grape::API
        resource :login do # define a resource named login that handles all requests related to logging in. >> what's resource mean?
            desc 'Logs in a user' # define a description for the login endpoint using the desc method.
            
            params do # define the required parameters for the login endpoint using the params method.
                requires :account, type: String, desc: 'User account name or email'
                requires :password, type: String, desc: 'User password'
            end
            
            post do # define the post method for the login endpoint.
                user = UserLogin.find_by(account: params[:account]) # Match model file's name with controller
                if user&.authenticate(params[:password])
                  { status: 'success', user_id: user.id }
                else
                  error!('Invalid account or password', 401)
                end
            end

        end
      end
  end