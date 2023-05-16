require 'net/http'
require 'json'
class RegisterAccountController < ApplicationController
    def index
        
    end

    def new
    end

    def submit




      response = ApiCaller.call_api('post', '1', 'register_account', {account:params[:account],password:params[:password],name:params[:name],email:params[:email],phone_number:params[:phone_number],age:params[:age],gender:params[:gender],height:params[:height],weight:params[:weight]})
      status_code = response[0]

      if status_code == 200
          flash[:success] = 'Success'
          @result = response[1]
          render :create_success
      else
          flash.now[:error] = "Failed to create account, error code: #{status_code} #{response[1]}"
          @result = response[1]
          render :show
      end

      flash[:error] = nil
    end
=begin
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
=end
end