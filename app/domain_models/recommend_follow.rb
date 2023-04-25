class RA

    #attr_reader :current_status,:current_following,:index

    def initialize(  )#將資料庫的紀錄轉換成當下的追蹤狀態
        #@subject_user_id = subject_user_id
        user_number=User.count
    end

    def random(subject_user_id, t, exclusive)
        s = follow_status_data.get_following(t)  - [ subject_user_id ] - exclusive
        unless t == subject_user_id
            s = s - follow_status_data.get_following(subject_user_id)
        end
        
        if s == []
            return rand( user_number ) 
        else
            return s[rand(s.length)];
        end
    end

    def random_walk(subject_user_id, order, exclusive)

        next_s = subject_user_id
        n  = []

        for k in (0...order).to_a 
            f_list = follow_status_data.get_following( next_s )
            next_s = random( subject_user_id, next_s, exclusive )
            n.append(next_s +1)
        end
        return n[-1]
    end

    def recomd( subject_user_id, orderlist )
        recomdlist = []
        for i in orderlist 
            rc = random_walk( subject_user_id, i, recomdlist ) 
        end
        return recomdlist 
    end


end

