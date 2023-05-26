require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class RecordSetsUpdateController < ApplicationController

    def edit_record
        id = params[:id]
        @record = SetsRecord.find_by(id: id)
    
        redirect_to error_path unless @record
    
        render :edit_record
    end
    
    def update_record

        id      = params[:id]
        @record = SetsRecord.find_by(id: id)
        content = params[:contents]
        set     = params[:sets].to_i
        rep     = params[:reps].to_i
        weight  = params[:weight].to_f

        record_sets = RecordSetsUpdate.new(id, content, set, rep, weight)


        begin

            if record_sets.update_set_record
                flash[:success] = 'Record updated successfully.'
                redirect_to set_record_path
            else
                flash.now[:error] = 'Failed to update record.'
                render :edit_record
            end

        rescue NoContentError
            flash.now[:error] = "Content is wrong. Please re-enter your content."
            render :edit_record

        rescue NoSetError
            flash.now[:error] = 'Set is wrong. Please re-enter your set.'
            render :edit_record

        rescue NoRepError
            flash.now[:error] = 'Rep is wrong. Please re-enter your Rep.'
            render :edit_record

        rescue NoWeightError
            flash.now[:error] = 'Weight is wrong. Please re-enter your weight.'
            render :edit_record

        rescue SameParamsError
            flash.now[:error] = 'Your input is same as former one.'
            render :edit_record

        end

    end

end
