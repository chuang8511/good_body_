class LoginController < ApplicationController    
    
    def new
        # render :new
    end

    def create
            
        email = params[:email]
        password = params[:password]
        
        if email.blank? || password.blank?
            flash.now[:error] = 'Please fill in all fields.'
            render :new
            return
        end
        
        # 呼叫 V1::LoginApi 的 login API
        response = ApiCaller.call_api('post', '1', 'login', {email: email, password: password})
        status_code = response[0]


        # 檢查 API 回傳的狀態碼，若為 200 則表示登入成功，否則登入失敗。
        if status_code == 200
            flash[:success] = 'Succeed to login'
            render :create_success
        else
            flash.now[:error] = "Login failed, error code: #{status_code} #{response}"
            render :new
        end

        flash[:error] = nil
          
          
    end

    
end
