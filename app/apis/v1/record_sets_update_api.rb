module V1

    class RecordSetsUpdateApi < Grape::API

        resource :record_sets_update do
        
            # 修改健身紀錄
            params do
                requires :id, type: Integer
                requires :contents, type: String
                requires :sets, type: Integer 
                requires :reps, type: Integer 
                requires :weight, type: Float
            end
  
            put do
                record_function = RecordSetsUpdate.new(
                    params[:id],
                    params[:contents], 
                    params[:sets], 
                    params[:reps], 
                    params[:weight]
                )
                record_function.update_set_record
            end
        
        end

    end

end    