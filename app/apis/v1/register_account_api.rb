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
                j=0
                if params[:account].nil? || params[:password].nil? || params[:name].nil? || params[:phone_number].nil? || params[:mail].nil?
                    
                    #必填欄位空白
                    {context: '必填欄位空白'}
                    j=1
                    #test: "1"
                    #context: 'at least one of the required fields is empty '
                end

                

                user=User.find_by(mail: params[mail])
                if user!=nil
                    #此mail已存在
                    j=1
                    {context: '郵件已存在'}
                    #test: "2"
                    #context: 'email duplicated'
                else
                    user=User.find_by(account: params[account])
                    if user!=nil
                        #此帳號已存在
                        j=1
                        {context: '帳號已存在'}
                        #test: "3"
                        #context: 'account already exist'

                    end
                end
            
                #以上有問題


                if j=0
                User.create!(account:params[:account],password:params[:password],name:params[:name],phone_number:params[:phone_number],height:params[:height],weight:params[:weight],age:params[:age],mail:params[:mail])
                
                #params[:account],params[:password],params[:name],params[:phone_number],params[:height],params[:weight],params[:age]
                {context: 'success'}
                end
            end
        end
        
    end
    
end