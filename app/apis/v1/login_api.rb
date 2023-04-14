module V1

    class LoginApi < Grape::API

        resource :login do

            params do

                requires :account, type: String
                requires :password, type: String

            end

            post do
            

                user = User.find_by(account: params[:account])

                if user.nil?
                    { message: '帳號不存在' }
                  elsif user.authenticate(params[:password])
                    { message: '登入成功！' }
                  else
                    { message: '密碼不正確，請再試一次' }
                  end



            end   
        end     
    end    
end    