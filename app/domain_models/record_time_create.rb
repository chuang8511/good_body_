class RecordTimeCreate

    attr_accessor :user_id, :contents, :duration
    
    def initialize(user_id, contents, duration)
        @user_id  = user_id
        @contents = contents
        @duration = duration
    end 


    def create_time_record #新增一個以time-based的健身紀錄
        TimesRecord.create!(user_id: user_id, contents: contents, duration: duration)
    end   
    

   
    
    def delete

    end
    
    def view

    end


    

    # def second_formatted(seconds) #把秒轉換為分鐘和小時 #先不做這個
    #     ["#{seconds / 3600}h","#{seconds / 60 % 60}m","#{seconds % 60}s"].select { |str| str =~ /[1-9]/ }.join(" ")
    # end

end


