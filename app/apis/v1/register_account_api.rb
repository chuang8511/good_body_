module V1

    class  RegisterAccountApi < Grape::API
<<<<<<< HEAD
        resource :register_account do 
=======
        resource :create_account do ##這段是什麼？
>>>>>>> dfc4a7a (0412noon)

            params do
                requires :account, type: String
                requires :password, type: String
                requires :name, type: String
                requires :phone_number, type: String
                requires :height, type: Integer
                requires :weight, type: Integer
                requires :age, type: Integer #（類別名稱）
<<<<<<< HEAD
                requires :email, type: String
            end

            post do
                validity_of_input_info = true
                
                if params[:account]=="" || params[:password]==""|| params[:name]=="" || params[:phone_number]=="" || params[:email]==""
                    #必填欄位空白
                    validity_of_input_info = false
                    return {context: '必填欄位空白'}
                end

                
=======
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
>>>>>>> dfc4a7a (0412noon)

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
                    
                    User.create!(account:params[:account],password:params[:password],name:params[:name],phone_number:params[:phone_number],height:params[:height],weight:params[:weight],age:params[:age],email:params[:email])
                    {context: '創建帳戶成功'}
                end
            end

        end
        
    end
    
end
