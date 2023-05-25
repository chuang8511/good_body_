class RecommendTxt

    #attr_reader :current_status,:current_following,:index
  
    def initialize()#將資料庫的紀錄轉換成當下的追蹤狀態
        #
    end

    def find_txt_recommend (user_id, num = 3)
        ############ find_txt_recommend ############
        # find out the last num data in both of the table accroding to the follower of user_id
        # input: userid: int ; num: int
        # output: txtlist : arr(2),  [nothing] for no eligible case
        ############################################
        fsd = FollowStatusData.new()
        rtr = RecomdTxtRepository.new()
        friendlist = fsd.get_following(user_id)
        txtlist = rtr.find_times_table(friendlist, num) + rtr.find_sets_table(friendlist, num)
        txtlist = txtlist.sort
        if txtlist.length <= num
            return txtlist
        else
            return txtlist.last(num)  # the num txt recommend. to userid
        end
    end

end