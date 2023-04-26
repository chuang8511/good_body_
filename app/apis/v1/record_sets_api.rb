module V1

    class RecordSetsApi < Grape::API
  
      resource :record_sets do
      # params do
      #   requires :functions
      # end  
        # 新增健身紀錄
        params do
          requires :functions, type: String
          requires :user_id, type: Integer
          requires :contents, type: String
          requires :sets, type: Integer # 組數
          requires :reps, type: Integer # 次數
          requires :weight, type: Float # 重量
        end
        
        post do
          record_function = RecordSetsFunctions.new(
            params[:functions],
            params[:user_id],
            params[:contents], 
            params[:sets], 
            params[:reps], 
            params[:weight]
          )
          record_function.set_functions
        end

        # 修改健身紀錄
        params do
          requires :functions, type: String
          requires :record_set_id, type: Integer
          requires :contents, type: String
          requires :sets, type: Integer 
          requires :reps, type: Integer 
          requires :weight, type: Float
        end
        
        put ':record_set_id' do
          record_function = RecordSetsFunctions.new(
            params[:feunctions],
            params[:record_set_id],
            params[:contents], 
            params[:sets], 
            params[:reps], 
            params[:weight]
          )
          record_function.set_functions
        end

        # 刪除健身紀錄
        params do
          requires :functions, type: String
          requires :record_set_id, type: Integer
        end
        
        delete ':record_set_id' do
          record_function = RecordSetsFunctions.new(
            params[:functions],
            params[:record_set_id]
          )
          record_function.set_functions
        end

        # 檢視健身紀錄
        get do
          record_function = RecordSetsFunctions.new(
            params[:functions],
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