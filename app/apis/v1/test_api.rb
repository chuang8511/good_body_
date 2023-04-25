module V1

    class TestApi < Grape::API

        resource :test do

            params do
                requires :test_id, type: String
                requires :check_point, type: Boolean
            end

            post do

                p 'It is a text'
                #p recommendation_follow.recomd( 1, [2,3] )

                TestUser.create!(name: "chunhao",
                identifier: params[:test_id],
                registration_datetime: Time.now)

                p 'It rue context'
                k=FollowStatusData.new()
                # s
                ii = RA.new()
                
                ii.recomd( 1, [2,3] )

                p 'It rue context'

                if params[:check_point]
                    {
                        test: params[:test_id],
                        context: "good"
                    }
                else
                    {
                        test: params[:test_id],
                        context: 'It is a false context'

                    }

                end


            end

        end


    end


end