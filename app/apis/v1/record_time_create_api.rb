module V1

    class  RecordTimeCreateApi < Grape::API
        resource :record_time_create do 

            params do
                requires :user_id, type: Integer
                requires :contents, type: String
                requires :duration, type: Integer
            end

            post do

                record_time = RecordTimeCreate.new(params[:user_id], params[:contents], params[:duration])
                
                record_time.create_time_record

            end    
        end
    end        
end