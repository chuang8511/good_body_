module V1

    class RecordSetsApi < Grape::API
  
      resource :record_sets do
  
  
        params do
          requires :functions, type: String # 選擇要什麼 Function: Sets / Times
          #requires :user_id, type: String
          requires :account, type: String
          requires :contents, type: String
          requires :sets, type: Integer # 組數
          requires :reps, type: Integer # 次數
          requires :weight, type: Float # 重量
        end
  
        post do
          # 指令想要做什麼
          
          # 新增、刪除、修改、查詢
          record_function = RecordSetsFunctions.new(params[:functions],params[:account],params[:contents], params[:sets], params[:reps], params[:weight])
          record_function.set_functions
          # 檢視健身狀態
          #user = User.find(params[:user_id])
          #user.record_sets
  
        end
  
      end
  
  
    end
  
  
  end