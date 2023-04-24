module V1

    class RecordSetsApi < Grape::API
  
      resource :record_sets do
  
        params do
          requires :functions, type: String # 選擇要什麼 Function: Sets / Times
          requires :user_id, type: String
          requires :contents, type: String
          requires :sets, type: Integer # 組數
          requires :reps, type: Integer # 次數
          requires :weight, type: Float # 重量
          requires :record_sets_id Interger
        end
        
        # 新增健身紀錄
        post do
          record_function = RecordSetsFunctions.new(
            "create",
            params[:user_id],
            params[:contents], 
            params[:sets], 
            params[:reps], 
            params[:weight]
          )
          record_function.set_functions
        end

        # 修改健身紀錄
        put ':record_set_id' do
          record_function = RecordSetsFunctions.new(
            "update",
            params[:user_id],
            params[:contents], 
            params[:sets], 
            params[:reps], 
            params[:weight],
            params[:record_set_id]
          )
          record_function.set_functions
        end

        # 刪除健身紀錄
        delete ':record_set_id' do
          record_function = RecordSetsFunctions.new(
            "delete",
            params[:user_id],
            nil, 
            nil, 
            nil, 
            nil,
            params[:record_set_id]
          )
          record_function.set_functions
        end

        # 檢視健身紀錄
        get do
          record_function = RecordSetsFunctions.new(
            "retrieve",
            params[:user_id],
            nil, 
            nil, 
            nil, 
            nil,
            nil
          )
          record_function.set_functions
        end

      end
  
  
    end
  
  
end