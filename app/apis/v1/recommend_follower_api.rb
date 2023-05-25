module V1
    class  RecommendFollowerApi < Grape::API

        resource :recommend_follower do
            params do
                requires :user_id, type: Integer
            end
        
        post do
            findfriend = RecommendFollow.new()
            friend_recomd = findfriend.recomd( params[:user_id], [4,3,2] )
            {
                follower1: friend_recomd[0], 
                follower2: friend_recomd[1], 
                follower3: friend_recomd[2]
            }
        end

    end
end
end