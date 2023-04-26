class RecommendTxt

    attr_reader :current_status,:current_following,:index
  
    def initialize()#將資料庫的紀錄轉換成當下的追蹤狀態
        @current_status={} #每個使用者的追蹤清單
        @current_following={}    #每個使用者的粉絲清單
        @index=1
        user_number=User.count
    end

    def find_sets_table (userid)
        p sets_table_of_userid = SetsRecords.where(user_id:1)
        #SetsRecords.includes(articles: [{ comments: :guest }, :tags]).find(1)
    end

    def find_times_table (userid)
        TimesRecords.find(user_id:user_id)
    end

    def find_table (user_id)
        p "i"
    end
end