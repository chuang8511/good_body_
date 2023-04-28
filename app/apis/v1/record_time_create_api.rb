module V1

    class  RecordTimeCreateApi < Grape::API
        resource :record_time_create do 

            params do
                requires :user_id, type: Integer
                requires :contents, type: String
                requires :duration, type: Integer
                requires :distance, type: Float
            end

            post do

                record_time = RecordTimeCreate.new(params[:user_id], params[:contents], params[:duration], params[:distance])
                
                record_time.create_time_record

            end    
        end
    end        
end