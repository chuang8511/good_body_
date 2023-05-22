require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class TimesRecordViewController < ApplicationController
    def index
        @times_records = TimesRecord.all
        render 'times_record/index'
    end
    
end