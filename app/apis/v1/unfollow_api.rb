module V1

    class UnfollowApi < Grape::API
  
      resource :unfollow do
  
  
        params do
          requires :subject_user_account, type: String 
          requires :object_user_account, type: String   
        end
  
        post do
  
          unfollow_user = FollowAndUnfollowUser.new(params[:subject_user_account])
  
          unfollow_user.unfollow(params[:object_user_account])
  
          return {context: params[:subject_user_account]+" has unfollowed "+params[:object_user_account]}
        
        end
  
      end
  
  
    end
  
  
  end