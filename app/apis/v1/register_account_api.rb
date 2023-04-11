module V1

    class  RegisterAccountApi < Grape::API
        resource :a do ##這段是什麼？

            ##來自postman?功能？
            params do
                requires :account, type: String
                requires :password, type: String
                requires :name, type: String
                requires :phone_number, type: String
                requires :height, type: Integer
                requires :weight, type: Integer
                requires :age, type: Integer #（類別名稱）
            end

            post do

                # User.create!(name: "chunhao",
                # identifier: params[:test_id],
                # registration_datetime: Time.now)
                User.create!(account: '123')

            end

        end
    


    end


end