module V1
    class  RecommendTxtApi < Grape::API

        resource :recommend_txt do
            params do
                requires :user_id, type: Integer
            end
        
        post do
            findtxt = RecommendTxt.new()
            txt = findtxt.find_txt_recommend(params[:user_id]) #arr(2)
            #txt = findtxt.find_txt_recommend(2)

            if txt.length == 2              # simple code ~/
                txt.append("lack of info")
            elsif txt.length == 1
                txt.append("lack of info")
                txt.append("lack of info")
            else
                txt.append("lack of info")
                txt.append("lack of info")
                txt.append("lack of info")
            end

            {
                txt1: txt[0],
                txt2: txt[1],
                txt3: txt[2]
            }

        end

    end
end
end