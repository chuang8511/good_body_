class RecordSetsController < ApplicationController
    
    def index
        user_id = session[:user_id]
        @sets_records = SetsRecord.where(user_id: user_id)
        
    end
end

