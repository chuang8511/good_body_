require 'uri'
require 'net/http'

class HomepageController < ApplicationController
    def index
        render 'homepage/index'
    end
    
end