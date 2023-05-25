require 'net/http'
require 'json'
class RegisterAccountController < ApplicationController

    def index
        
    end

    def submit
        @register_account_user = RegisterAccountUser.new(params[:account],params[:password],params[:name],params[:email],params[:phone_number],params[:age],params[:gender],params[:height],params[:weight])
        if @register_account_user.create_account
        # 成功
          session[:account] = params[:account]
          render :show
        else
        # 失敗
          render :index
      end
    end

    def personal_profile
        #render plain: "<h1>你好，世界!</h1>"
        user = User.find_by(account: session[:account] )
        @weight = user.weight 
        @height = user.height
        @age = user.age  
        @gender = user.gender
    end

    def update
        #p session[:account] 
    end

    def update_action
        info_ident = InfoIdentification.new()
        user = User.find_by(account: session[:account] )

        if (user.nil?)   #testify the existance of the account
          #
        else  #personal info. delivery
          weight = info_ident.weight_testify(params[:weight_modified].to_i)
          height = info_ident.height_testify(params[:height_modified].to_i)
          age =    info_ident.age_testify(params[:age_modified].to_i)
          gender = params[:gender_modified]
          user.update!(height: height,weight: weight,age: age,gender: gender)
          render :show
        end
    end

    def wrong_height
      #
    end

    def show
      findtxt = RecommendTxt.new()
      user = User.find_by(account: session[:account] )
      user_id = user.id
      txt = findtxt.find_txt_recommend(user_id) 

      if txt.length == 2             
          txt.append(" ")
      elsif txt.length == 1
          txt.append(" ")
          txt.append(" ")
      else
          txt.append("No new sport record")
          txt.append(" ")
          txt.append(" ")
      end

      def output_txt(sublist)
        if sublist.length == 6
          user = User.find_by(id: sublist[1])
          name = user.name
          return name  + " do " + sublist[3].to_s   + " sets of " + sublist[2].to_s  + " with reps" + sublist[4].to_s  +   " weight " +  sublist[5].to_s  + " when " + sublist[0].to_s 
        elsif sublist.length == 4
          user = User.find_by(id: sublist[1])
          name = user.name
          return name  + " " +  sublist[2].to_s   + " for " + sublist[3].to_s + " when " + sublist[0].to_s 
        else
          return " "
        end
      end

      @txt1 = output_txt(txt[0])
      @txt2 = output_txt(txt[1])
      @txt3 = output_txt(txt[2])

      # friend recomd
      findfriend = RecommendFollow.new()
      friend_recomd = findfriend.recomd( user_id, [4,3,2] )
      @friend1 = User.find_by(id: friend_recomd[0]).name
      @friend2 = User.find_by(id: friend_recomd[1]).name
      @friend3 = User.find_by(id: friend_recomd[2]).name
    end

end