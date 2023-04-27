class RecommendTxt

    attr_reader :current_status,:current_following,:index
  
    def initialize()#將資料庫的紀錄轉換成當下的追蹤狀態
        #
    end

    def find_sets_table (userid, num = 1)
        # find out the last num data in SetsRecords for user~userid
        # input: userid: arr ; num: int
        # output: outputlist: arr(2)
        outputlist = []
        sets_table_of_userid = SetsRecords.where(user_id:userid).order(created_at: :desc).limit(num)
        unless sets_table_of_userid.count == 0
            for i in (0...num)
                outputlist.append( [
                    sets_table_of_userid[i].created_at,
                    sets_table_of_userid[i].user_id, 
                    sets_table_of_userid[i].contents, 
                    sets_table_of_userid[i].sets, 
                    sets_table_of_userid[i].reps, 
                    sets_table_of_userid[i].weight
                    ] )
            end
            return outputlist   # [ created_at, user_id, contents, duation ]_i
        else
            return []
        end   
    end

    def find_times_table (userid, num = 1)
        # find out the last num data in TimesRecords for user~userid
        # input: userid: arr ; num: int
        # output: outputlist: arr(2)
        outputlist = []
        times_table_of_userid = TimesRecords.where(user_id:userid).order(created_at: :desc).limit(num)
        unless times_table_of_userid.count == 0
            p times_table_of_userid
            for i in (0...num) 
                    outputlist.append([
                    times_table_of_userid[i].created_at,
                    times_table_of_userid[i].user_id, 
                    times_table_of_userid[i].contents, 
                    times_table_of_userid[i].duration, 
                    ] )
                end
            return outputlist   # [ created_at, user_id, contents, duation ]_i
        else
            return []
        end   
    end

    def find_txt_recommend (user_id, num = 3)
        # find out the last num data in both of the table accroding to the follower of user_id
        # input: userid: int ; num: int
        # output: txtlist : arr(2)
        fsd = FollowStatusData.new()
        friendlist = fsd.get_following(user_id)
        txtlist = find_times_table(friendlist, num) + find_sets_table(friendlist, num)
        txtlist = txtlist.sort
        if txtlist.length <= num
            return txtlist
        else
            return txtlist.last(num)  # the num txt recommend. to userid
        end
    end

end