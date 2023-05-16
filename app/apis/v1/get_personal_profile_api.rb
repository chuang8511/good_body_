module V1
    class  GetPersonalProfileApi < Grape::API
        resource :get_personal_profile do
            params do
                requires :account, type: String
            end
            post do  #get personal info.
                user = User.find_by(account: params[:account])
                if (user.nil?)   #testify the existance of the account
                    return {
                        context: '帳戶不存在'
                    }
                else  #personal info. delivery
                    return {
                        height: user.weight,   ## temp setting ~/23
                        weight: user.height,
                        age: user.age,   ## temp setting ~/23
                        gender: user.gender
                    }
                end
            end
        end
    end
end