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
        status, headers, body = V1::LoginApi.call({email: email, password: password})
        
        # 檢查 API 回傳的狀態碼，若為 200 則表示登入成功，否則登入失敗。
        if status == 200
            # 登入成功，導向首頁
            flash[:success] = 'Succeed to login'
            render :create_success
            # redirect_to root_path
        else
            # 登入失敗，導向登入頁面，顯示錯誤訊息
            flash.now[:error] = 'Fail to login'
            render :new
        end

        flash[:error] = nil
          
          
    end

    
end
