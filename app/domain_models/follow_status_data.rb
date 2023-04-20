class FollowStatusData

    attr_reader :current_status,:index
  
    def initialize()#將資料庫的紀錄轉換成當下的追蹤狀態
        @current_status={}
        @index=1
        user_number=User.count

        1.upto(user_number) do |user_id|
            
            current_status[user_id] = Array.new()
        end

        FollowStatusRecord.all.each do |record|
            update_one_record(record)
        end

         #應該要是一個hash，內容是目前的追蹤狀態
       
         
    end

    def individual_records_to_following_list(individual_records)
        individual_following_list=[]
        individual_records.each do |record|
            individual_following_list.append(record.object_user_id) if record.action_type=="follow"
            individual_following_list.delete(record.object_user_id) if record.action_type=="unfollow"

        end
        return individual_following_list
    end

    def update_one_record(record)#從資料庫讀取下一筆紀錄，用以更新FollowStatusData
            
            
            
       
            current_status[record.subject_user_id].append(record.object_user_id) if record.action_type=="follow"
            current_status[record.subject_user_id].delete(record.object_user_id) if record.action_type=="unfollow"
            @index+=1
            
    end

    def update_record_to_latest()#從資料庫讀取下一筆紀錄，用以更新FollowStatusData
        record_number=FollowStatusRecord.count
        read_record_number=index-1
        (record_number-read_record_number).times do
            update_one_record(FollowStatusRecord.find_by(id:@index))
        end
    end
end


