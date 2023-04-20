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
                requires :age, type: Integer #（類別名稱）
                requires :email, type: String
                requires :gender, type: String
            end

            post do
                validity_of_input_info = true
                
                if params[:account]=="" || params[:password]==""|| params[:name]=="" || params[:phone_number]=="" || params[:email]==""
                    #必填欄位空白
                    validity_of_input_info = false
                    return {context: '必填欄位空白'}
                end

                

                user=User.find_by(email: params[:email])
                if not(user.nil?)
                
                    validity_of_input_info = false
                    return {context: '郵件已存在'}
                
                   
                elsif !(params[:email].include? "@")
                    validity_of_input_info = false
                    return {context: '郵件格式錯誤'}   
                    
                end
                
                user=User.find_by(account: params[:account])
                if not(user.nil?)
                        #此帳號已存在
                        validity_of_input_info = false
                        return {context: '帳號已存在'}
                end

                user=User.find_by(phone_number: params[:phone_number])
                if not(user.nil?)
                        #此帳號已存在
                    validity_of_input_info = false
                    return {context: '手機號碼已存在'}
                elsif !(params[:phone_number].length==10)
                    validity_of_input_info = false
                    return {context: '手機號碼格式錯誤'}
                elsif !(params[:phone_number][0..1]=="09")
                    validity_of_input_info = false
                    return {context: '這不是有效的手機號碼'}
                    
                end
                

                if validity_of_input_info
                    
                    User.create!(account:params[:account],password:params[:password],name:params[:name],phone_number:params[:phone_number],height:params[:height],weight:params[:weight],age:params[:age],email:params[:email],gender:params[:gender])
                    {context: '創建帳戶成功'}
                end
            end
        end
        
        
    end
    
    
end
