require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class RecordSetsCreateController < ApplicationController
    def new
        render 'record_sets_create/new'

    end

    def create
        
        user_id = session[:user_id]
        content = params[:contents]
        set     = params[:sets].to_i
        rep     = params[:reps].to_i
        weight  = params[:weight].to_f
        
        record_set = RecordSetsCreate.new(user_id, content, set, rep, weight)

        begin
            record_set.create_set_record
            flash[:notice] = 'Set record has been created successfully.'
            redirect_to set_record_path
          rescue NoContentError, NoSetError, NoRepError, NoWeightError => e
            flash.now[:error] = e.message
            render :new
        end

    end

end