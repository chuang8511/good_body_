module V1

    class  RecordTimeApi < Grape::API
        resource :record_time do 

            params do
                requires :function, type: String
                requires :account, type: String
                requires :contents, type: String
                requires :duration, type: Integer
            end

            post do

                record_time = RecordTime.new(params[:function], params[:account], params[:contents], params[:duration])
                
                record_time.action

            end    
        end
    end        
end