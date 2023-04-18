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
                
                if params[:account]=="" || params[:password]==""|| params[:name]=="" || params[:phone_number]=="" || params[:mail]==""
                    
                    #必填欄位空白
                    j=1
                    return {context: '必填欄位空白'}
                end

                

                user=User.find_by(mail: params[:mail])
                if user!=nil
                    #此mail已存在
                    j=1
                    return {context: '郵件已存在'}
                    #test: "2"
                    #context: 'email duplicated'
                else
                    
                end
                user=User.find_by(account: params[:account])
                    if user!=nil
                        #此帳號已存在
                        j=1
                        return {context: '帳號已存在'}
                        #test: "3"
                        #context: 'account already exist'

                end

                user=User.find_by(phone_number: params[:phone_number])
                if user!=nil
                        #此帳號已存在
                        
                    j=1
                    return {context: '手機號碼已存在'}
                elsif !(params[:phone_number].length==10)
                    j=1
                    return {context: '手機號碼格式錯誤'}
                elsif !(params[:phone_number][0..1]=="09")
                    j=1
                    return {context: '這不是有效的手機號碼'}
                end
                #以上有問題

                if j==0
                User.create!(account:params[:account],password:params[:password],name:params[:name],phone_number:params[:phone_number],height:params[:height],weight:params[:weight],age:params[:age],mail:params[:mail])
                
               
                {context: '創建帳戶成功'}
                end
            end
        end
        
    end
    
end