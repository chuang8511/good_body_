module V1

  class Root < Grape::API

    version 'v1'
    format :json
    content_type :json, 'application/json'

    mount V1::TestApi
    mount V1::LoginApi
    mount V1::RegisterAccountApi
    mount V1::RecommendFollowerApi
    mount V1::RecommendTxtApi
    mount V1::GetPersonalProfileApi 
    mount V1::UpdatePersonalProfileApi

  end

end
