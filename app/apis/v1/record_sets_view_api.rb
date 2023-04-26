module V1

    class RecordSetsViewApi < Grape::API
  
        resource :record_sets_view do


            params do
                requires :user_id, type: Integer
            end


            post do
                SetsRecord.where(user_id: params[:user_id])
            end    
        end
    end
end       


# # 檢視健身紀錄
# get do
#     record_function = RecordSetsView.new(params[:user_id])
#     record_function.view_set_record
#   end


#     def view_set_record
#         SetsRecord.find_by(user_id: user_id)
#     end

# end