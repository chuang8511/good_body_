module V1

    class  ViewUserRecordApi < Grape::API
        resource :view_user_record do 

            params do
                requires :user_account, type: String

            end

            post do

                user_record = ViewUserRecord.new(params[:user_account])
            
                JSON.parse(user_record.to_json.view)

                #回傳的好像沒被視為json?

            end    
        end
    end
end