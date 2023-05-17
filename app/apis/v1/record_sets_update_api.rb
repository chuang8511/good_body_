module V1

    class RecordSetsUpdateApi < Grape::API

        resource :record_sets_update do
        
            # 修改健身紀錄
            params do
                requires :id, type: Integer
                requires :content, type: String
                requires :set, type: Integer 
                requires :rep, type: Integer 
                requires :weight, type: Float
            end
  
            put do
                record_function = RecordSetsUpdate.new(
                    params[:id],
                    params[:content], 
                    params[:set], 
                    params[:rep], 
                    params[:weight]
                )
                record_function.update_set_record
            end
        
        end

    end

end    