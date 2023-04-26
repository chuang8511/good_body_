require_relative "follow_status_data"
class FollowAndUnfollowUser

    attr_reader :subject_user_id, :follow_status_data
  
    def initialize(subject_user_account)
      @subject_user_id=User.find_by(account: subject_user_account).id
      @follow_status_data=FollowStatusData.new()
    end

    def follow(object_user_account)
        object_user_id=User.find_by(account: object_user_account).id

        already_following!(object_user_id)
        follow_status_data.add_follow_status_record(subject_user_id,"follow",object_user_id)
        
    end

    def unfollow(object_user_account)
        object_user_id=User.find_by(account: object_user_account).id

        not_following!(object_user_id)
        follow_status_data.add_follow_status_record(subject_user_id,"unfollow",object_user_id)
    
        
    end

    def already_following!(object_user_id)
        raise AlreadyFollowingError.new(@subject_user_id,object_user_id) if follow_status_data.get_following(@subject_user_id).include?(object_user_id)
    end

    def not_following!(object_user_id)
        raise NotFollowingError.new(@subject_user_id,object_user_id) if not(follow_status_data.get_following(@subject_user_id).include?(object_user_id))
    end
end

class AlreadyFollowingError < StandardError
    def initialize(subject_user_id,object_user_id)
      msg = "#{User.find_by(id: subject_user_id).account} is already following  #{User.find_by(id: object_user_id).account}"
      super(msg)
    end
end

class NotFollowingError < StandardError
    def initialize(subject_user_id,object_user_id)
      msg = "#{User.find_by(id: subject_user_id).account} is not following  #{User.find_by(id: object_user_id).account}"
      super(msg)
    end
end