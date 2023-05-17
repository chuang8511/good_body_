module V1

  class Root < Grape::API

    version 'v1'
    format :json
    content_type :json, 'application/json'

    mount V1::TestApi
    mount V1::LoginApi
    mount V1::RegisterAccountApi
    mount V1::RecordTimeCreateApi
    mount V1::RecordTimeUpdateApi
    mount V1::RecordTimeDeleteApi
    mount V1::RecordSetsCreateApi
    mount V1::RecordSetsUpdateApi
    mount V1::RecordSetsDeleteApi
    mount V1::RecordSetsViewApi

  end

end
