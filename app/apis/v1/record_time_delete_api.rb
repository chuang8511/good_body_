module V1

    class  RecordTimeDeleteApi < Grape::API
        resource :record_time_delete do 

            params do
                requires :id, type: Integer
            end

            delete do

                record_time = RecordTimeDelete.new(params[:id])
                
                record_time.delete_time_record

            end    
        end
    end        
end