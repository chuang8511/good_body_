require 'net/http'
require 'json'
class ViewUserRecordController < ApplicationController

    def index
        render :index
    end

    def view
        view_user_record=ViewUserRecord.new(params[:account])
        records=view_user_record.view


        @account=params[:account]
        @record_txt=[]
        records.each do |record|
            if record.length == 6
                @record_txt.append(" Done " + record[3].to_s   + " sets of " + record[2].to_s  + " with reps" + record[4].to_s  +   " weight " +  record[5].to_s  + " when " + record[0].to_s)
            else record.length == 5
                
                @record_txt.append(" Done " +  record[2].to_s   + " for " + record[3].to_s + " when " + record[0].to_s+ " with the of distance of "+ record[4].to_s)
            end

        end
        
        render :view_user_record
    end

   
end