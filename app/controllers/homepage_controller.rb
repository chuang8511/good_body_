require 'uri'
require 'net/http'

class HomepageController < ApplicationController
    def index
        render 'homepage/homepage'
    end

end