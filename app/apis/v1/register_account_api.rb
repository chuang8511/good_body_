module V1

    class  RegisterAccountApi < Grape::API
        resource :create_account do ##這段是什麼？

            ##來自postman?功能？
            params do
                requires :account, type: String
                requires :password, type: String
                requires :name, type: String
                requires :phone_number, type: String
                requires :height, type: Integer
                requires :weight, type: Integer
                requires :age, type: Integer #（類別名稱）
                requires :mail, type: String
            end

            post do
                
                #if params[account].nil? || params[password].nil? || params[name].nil? || params[phone_number].nil? || params[mail].nil?
                    #必填欄位空白
                    #context: 'at least one of the required fields is empty '
                #end

                
"""
                user=User.find_by(account: params[mail])
                if user!=nil
                    #此mail已存在
                    context: 'email duplicated'
                else
                    user=User.find_by(account: params[account])
                    if user!=nil
                        #此帳號已存在
                        context: 'account already exist'

                    end
                end
"""
                User.create!(account:params[:account],password:params[:password],name:params[:name],phone_number:params[:phone_number],height:params[:height],weight:params[:weight],age:params[:age])
                #params[:account],params[:password],params[:name],params[:phone_number],params[:height],params[:weight],params[:age]

            end

        end
    


    end


end