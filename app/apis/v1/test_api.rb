module V1

    class TestApi < Grape::API

        resource :test do


            params do
                requires :test_id, type: String
            end

            post do

                {
                    test: params[:test_id]
                }
            end

        end


    end


end