module V1

    class  RegisterAccountApi < Grape::API
        resource :register_account do 
            
            params do
                requires :account, type: String
                requires :password, type: String
                requires :name, type: String
                requires :phone_number, type: String
                requires :height, type: Integer
                requires :weight, type: Integer
                requires :age, type: Integer 
                requires :email, type: String
                requires :gender, type: String
            end

            post do

            register_account_user=RegisterAccountUser.new(params[:account],params[:password],params[:name],params[:email],params[:phone_number],params[:age],params[:gender],params[:height],params[:weight])
            register_account_user.create_account
        end
        
        
    end
    
    
end
end
