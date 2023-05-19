module V1

    class RecordSetsDeleteApi < Grape::API
  
      resource :record_sets_delete do

        # 刪除健身紀錄
        params do
          requires :id, type: Integer
        end
        
        delete do
          record_function = RecordSetsDelete.new(params[:id])
          record_function.delete_set_record
        end
      
      end
    
    end

  end