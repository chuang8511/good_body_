class RecordSetsController < ApplicationController
    
    def index
        @sets_records = SetsRecord.all
    end
end

