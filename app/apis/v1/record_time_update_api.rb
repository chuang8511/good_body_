module V1

    class  RecordTimeUpdateApi < Grape::API
        resource :record_time_update do 

            params do
                requires :id, type: Integer
                requires :contents, type: String
                requires :duration, type: Integer
                requires :distance, type: Float
            end

            put do

                record_time = RecordTimeUpdate.new(params[:id], params[:contents], params[:duration], params[:distance])
                
                record_time.update_time_record 

            end    
        end
    end
end