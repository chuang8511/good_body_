require 'net/http'
require 'json'
class RegisterAccountController < ApplicationController
    def index
        
    end

    def submit
        #create_account(params[:account],params[:password],params[:email],params[:phone_number],params[:name],params[:gender],params[:age],params[:height],params[:weight])
        form_data = params

        uri = URI.parse('http://localhost:3000/v1/register_account')
        http = Net::HTTP.new(uri.host, uri.port)
        http.read_timeout = 10
        request = Net::HTTP::Post.new(uri.path)
        request['Content-Type'] = 'application/json'
        request.body = form_data.to_json
      
        response = http.request(request)
   
        # web cant get response from api. always timeout. token lost?
        #if response.code.to_i == 200
          @result = JSON.parse(response.body)
        render json: { result: 'a' }#:show
       # else
          #render json: { result: 'error' }, status: :unprocessable_entity
       # end


        # ...
    end

    private

    def create_account(account,password,email,phone_number,name,gender,age,height,weight)
      request_api(
        "http://localhost:3000/v1/register_account/#{URI.encode(name)}"
      )
    end
end