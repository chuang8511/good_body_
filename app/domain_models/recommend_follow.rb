class RecommendFollow
    ###################################################################################
    ############  very simple random walk recommendation model (non-eqil.) ############ 
    ###################################################################################
        ## description: clustering phenomenon is expected
        ##            : long-term interaction performed in remnants
        ##            : small scale system is especially considerate
        ##            : only consider unilateral following relations
    ###################################################################################
    
        attr_reader :fsd, :user_number
    
        def initialize(  ) #將資料庫的紀錄轉換成當下的追蹤狀態
            @user_number = User.count
            @fsd = FollowStatusData.new()
        end
    
        def random(subject_user_id, t, exclusive) 
                # generate the next step (inner)
    
                unless fsd.get_following(t).nil?
                    next_s_list = fsd.get_following(t)  - [ subject_user_id ] - exclusive
                else
                    next_s_list = (1..User.count).to_a - [subject_user_id] - exclusive - fsd.get_following(subject_user_id)
                    return next_s_list[ rand( next_s_list.length ) ]
                end
    
                unless t == subject_user_id 
                    next_s_list = next_s_list - fsd.get_following(subject_user_id)
                end
            
                if next_s_list.length == 0 or next_s_list.length.nil?
                    next_s_list = (1..User.count).to_a - [subject_user_id] - exclusive - fsd.get_following(subject_user_id)
                    return next_s_list[ rand( next_s_list.length ) ]
                else
                    return next_s_list[rand(next_s_list.length)]
                end
    
        end
    
        def random_walk(subject_user_id, order, exclusive)
            #random walk from the first step to the order-th step
            next_s = subject_user_id # initialization
            next_step_list  = []
    
            for k in (0...order).to_a 
                f_list = fsd.get_following( next_s )
                next_s = random( subject_user_id, next_s, exclusive )
                next_step_list.append(next_s)
            end
            return next_step_list[-1]
        end
    
        def recomd( subject_user_id, orderlist )  # main()
            ############ Main ############ 
            # input: subject_user_id: int ,  target user's id;
            ##     : orderlist: arr(1)    ,  the order of the random walk
            # output: recomd_follower_list: arr(1) , recommendated followrs, [nil] for no eligible case
            ##############################
            recomdlist = []
            for i in orderlist 
                recomdlist.append( random_walk( subject_user_id, i, recomdlist ) )
            end
            return recomdlist - fsd.get_following(subject_user_id)
        end
    end