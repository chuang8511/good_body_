require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class TimesRecordCreateController < ApplicationController
    def new
        render 'times_record/new'

    end

    def create

        user_id = session[:user_id]

        record_time = RecordTimeCreate.new(
            user_id,
            params[:record][:contents],
            params[:record][:duration].to_i,
            params[:record][:distance].to_f
        )
        begin
            record_time.create_time_record
            flash[:notice] = 'Time record has been created successfully.'
            redirect_to times_record_path
          rescue NoContentError, NoDurationError, NoDistanceError => e
            flash.now[:error] = e.message
            render :new
        end

    end
    
end