require 'net/http'
require 'json'
class ViewUserRecordController < ApplicationController

    def index
        
    end

    def view
        view_user_record=ViewUserRecord.new(params[:account])
        @records=view_user_record.view
        
        p records
        #??
        render :view_user_record
    end

   
end