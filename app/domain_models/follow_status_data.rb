class FollowStatusData

    attr_reader :each_user_following_list,:each_user_follower_list,:index
  
    def initialize()#converting following record to following status
        @each_user_following_list=Hash.new([])   #A list of people who the user is following
        @each_user_follower_list=Hash.new([])    #A list of people who are following a particular user
        @index=1
        user_number=User.count

        #initializing the 2 lists. Assign an empty array as value to each user id(key)
        1.upto(user_number) do |user_id|
            each_user_following_list[user_id]=Array.new()
            each_user_follower_list[user_id]=Array.new()
        end
        
        #read and convert records from follow_status_record table, record by record
        FollowStatusRecord.all.each do |record|
            update_one_record(record)
        end
  
    end

    def update_record_to_latest()#read new records from DB

        record_number=FollowStatusRecord.count
        read_record_number=index-1
        if (record_number-read_record_number)==0
            p "record list is already the latest" 
        else
            (record_number-read_record_number).times do
                update_one_record(FollowStatusRecord.find_by(id:@index))
            end
        end
    end

    def add_follow_status_record(subject_user_id,action_type,object_user_id)
        
        FollowStatusRecord.create!(subject_user_id:subject_user_id,action_type:action_type,object_user_id:object_user_id)
        
        update_record_to_latest()
      
    end

    def get_following(subject_user_id)
       
        return each_user_following_list[subject_user_id]
    end

    def get_follower(subject_user_id)
        return each_user_follower_list[subject_user_id]
    end

    def get_record_number()
        return FollowStatusRecord.all.count
    end

private
def update_one_record(record)
        
    if record.action_type=="follow"
        each_user_following_list[record.subject_user_id].append(record.object_user_id) 
        each_user_follower_list[record.object_user_id].append(record.subject_user_id)

    elsif record.action_type=="unfollow"
        each_user_following_list[record.subject_user_id].delete(record.object_user_id) 
        each_user_follower_list[record.object_user_id].delete(record.subject_user_id)
        
    end
    @index+=1
        
end

end


