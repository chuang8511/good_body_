module V1
    class  RecommendFollowerApi < Grape::API

        resource :recommend_follower do
            params do
                requires :user_id, type: Integer
            end
        

        post do
            findfriend = RecommendFollow.new()
            {
                test: findfriend.recomd( params[:user_id], [2,3,4] )
            }
        end

    end
end
end