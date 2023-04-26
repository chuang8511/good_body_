module V1

    class  RecordTimeUpdateApi < Grape::API
        resource :record_time_update do 

            params do
                requires :id, type: Integer
                requires :contents, type: String
                requires :duration, type: Integer
            end

            put do

                record_time = RecordTimeUpdate.new(params[:id], params[:contents], params[:duration])
                
                record_time.update_time_record #(params[:id], params[:contents], params[:duration])

            end    
        end
    end
end