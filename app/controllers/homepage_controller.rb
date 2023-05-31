require 'uri'
require 'net/http'

class HomepageController < ApplicationController
    def index
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
  
        #render 'homepage/index'
    end
    
end

