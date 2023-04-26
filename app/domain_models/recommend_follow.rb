class RecommendFollow

    attr_reader :current_status,:current_following,:index

    def initialize(  )#將資料庫的紀錄轉換成當下的追蹤狀態
        #@subject_user_id = subject_user_id
        user_number = User.count
    end

    def random(subject_user_id, t, exclusive)
            user_number = User.count
            fsd = FollowStatusData.new()
            unless fsd.get_following(t).nil?
                s = fsd.get_following(t)  - [ subject_user_id ] - exclusive
            else
                s = (1..User.count).to_a - [subject_user_id] - exclusive
                return s[ rand( s.length ) ]
            end

            
            unless t == subject_user_id
                s = s - fsd.get_following(subject_user_id)
            end
        
            if s == [] or s.length.nil?
                return subject_user_id
            else
                return s[rand(s.length)]
            end
    end

    def random_walk(subject_user_id, order, exclusive)

        next_s = subject_user_id
        n  = []

        for k in (0...order).to_a 
            fsd = FollowStatusData.new()
            f_list = fsd.get_following( next_s )
            next_s = random( subject_user_id, next_s, exclusive )
            n.append(next_s)
        end
        unless ( n[-1] == subject_user_id )
            return n[-1]
        else
            b = (1..User.count).to_a - [subject_user_id] - fsd.get_following(subject_user_id) - exclusive
            #p fsd.get_following(subject_user_id) , "ppp"
            return b[ rand( b.length ) ]
        end
    end



    def recomd( subject_user_id, orderlist )
        recomdlist = []
        for i in orderlist 
            recomdlist.append( random_walk( subject_user_id, i, recomdlist ) )
        end
        fsd = FollowStatusData.new()
        return recomdlist - fsd.get_following(subject_user_id)
    end
end
