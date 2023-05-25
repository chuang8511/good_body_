require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class TimesRecordUpdateController < ApplicationController

    def edit
        @times_record = TimesRecord.find(params[:id])
        render 'times_record/edit'
    end

    def update
        id       = params[:id] 
        contents = params[:times_record][:contents]
        duration = params[:times_record][:duration].to_i
        distance = params[:times_record][:distance].to_f
        record_update = RecordTimeUpdate.new(id, contents, duration, distance)

        begin
            record_update.update_time_record
            flash[:notice] = 'Times record has been successfully updated.'
            redirect_to times_record_path
          rescue NoContentError, NoDurationError, NoDistanceError, SameParamsError => e
            @times_record = TimesRecord.find(params[:id])
            flash.now[:error] = e.message
            render 'times_record/edit'
          end
        
    end
    
end