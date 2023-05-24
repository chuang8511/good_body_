require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class TimesRecordViewController < ApplicationController
    def index
        user_id = session[:user_id]
        @times_records = TimesRecord.where(user_id: user_id)
        render 'times_record/index'
    end
    
end