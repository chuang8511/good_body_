module V1

    class TestApi < Grape::API

        resource :test do

            #test
            params do
                requires :test_id, type: String
                requires :check_point, type: Boolean
            end

            post do

                TestUser.create!(name: "chunhao",
                identifier: params[:test_id],
                registration_datetime: Time.now)

                if params[:check_point]
                    {
                        test: params[:test_id],
                        context: 'It is a true context'
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