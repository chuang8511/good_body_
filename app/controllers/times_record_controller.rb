class TimesRecordController < ApplicationController
    def index
        @times_records = TimesRecord.all
    end

    def delete
        id = params[:id] 
        record_delete = RecordTimeDelete.new(id)
        record_delete.delete_time_record
        redirect_to times_record_path, notice: 'Times record has been deleted.'
    end
    
end