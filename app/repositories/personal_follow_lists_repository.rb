class PersonalFollowListsRepository

    attr_reader :following_list,:follower_list,:subject_user_id
  
    def initialize(subject_user_account)#converting following record to following status
        @following_list=[]   #A list of people who the user is following
        @subject_user_id=User.find_by(account: subject_user_account).id


        #read and convert records from follow_status_record table, record by record
        FollowStatusRecord.where(subject_user_id:subject_user_id).each do |record|
            if record.action_type=="follow"
                following_list.append(record.object_user_id) 
            elsif record.action_type=="unfollow"
                following_list.delete(record.object_user_id) 
            end
        end
    end


    def add_follow_status_record(subject_user_id,action_type,object_user_id)
        FollowStatusRecord.create!(subject_user_id:subject_user_id,action_type:action_type,object_user_id:object_user_id)
    end

    def get_following()
        return following_list
    end

    def get_record_number()
        return FollowStatusRecord.all.count
    end


end


