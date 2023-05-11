module V1

    class FollowApi < Grape::API
  
      resource :follow do
  
  
        params do
          requires :subject_user_account, type: String 
          requires :object_user_account, type: String   
        end
  
        post do
  
          follow_user = FollowAndUnfollowUser.new(params[:subject_user_account])
  
          follow_user.follow(params[:object_user_account])
          
          return {context: params[:subject_user_account]+" has followed "+params[:object_user_account]}
  
        end
  
      end
  
  
    end
  
  
  end