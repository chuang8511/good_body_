require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class LoginController < ApplicationController

  def index
  end

  def login

    email = params[:email].strip

    password = params[:password].strip

    uuid = SecureRandom.uuid

    login_user = LoginUser.new(uuid, email)

    user = User.find_by(email: email)

    begin

      if login_user.login(password)
        session[:user_id] = user.id
        user = User.find_by(id: session[:user_id] )
        session[:account] = user.account


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
        @friend1 = User.find_by(id: friend_recomd[0]).account
        @friend2 = User.find_by(id: friend_recomd[1]).account
        @friend3 = User.find_by(id: friend_recomd[2]).account
      end

        # render 'homepage/index'
        #redirect_to homepage_path
        render 'register_account/show'
        
      end

    rescue NoUserError

      flash.now[:notice] = 'Wrong Email. Please try again'

      render :index

    rescue WrongPasswordError

      flash.now[:notice] = 'Wrong Password. Please try again'

      render :index
    
    end
  #end
end