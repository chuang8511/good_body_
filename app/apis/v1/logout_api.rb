module V1

    class LogoutApi < Grape::API
  
      resource :logout do
  
  
        params do

          requires :account, type: String
          
        end
  
        post do

            user = User.find_by(account: params[:account])

            if user

                {msg: 'You are logged out'}

            end    
  
          
  
        end
  
      end
  
  
    end
  
  
  end