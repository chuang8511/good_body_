require_relative "../repositories/personal_follow_lists_repository"#personal_follow_lists_repository"
class FollowAndUnfollowUser

    attr_reader :subject_user_id, :follow_list
  
    def initialize(subject_user_account)
      @subject_user_id=User.find_by(account: subject_user_account).id
      @follow_list=PersonalFollowListsRepository.new(subject_user_account)
    end

    def follow(object_user_account)
        object_user_id=User.find_by(account: object_user_account).id
        cannot_follow_yourself!(object_user_id)
        already_following!(object_user_id)
        succeed_to_create_record("follow",object_user_id)

        
    end

    def unfollow(object_user_account)
        object_user_id=User.find_by(account: object_user_account).id
        cannot_follow_yourself!(object_user_id)
        not_following!(object_user_id)
        succeed_to_create_record("unfollow",object_user_id)
    
        
    end
    
private
    def cannot_follow_yourself!(object_user_id)
        raise SelfFollowingError.new(@subject_user_id,object_user_id) if @subject_user_id==object_user_id
    end

    def already_following!(object_user_id)
        raise AlreadyFollowingError.new(@subject_user_id,object_user_id) if follow_list.get_following.include?(object_user_id)
    end

    def not_following!(object_user_id)
        raise NotFollowingError.new(@subject_user_id,object_user_id) if not(follow_list.get_following.include?(object_user_id))
    end

    def succeed_to_create_record(action_type,object_user_id)
        follow_list.add_follow_status_record(subject_user_id,action_type,object_user_id)
    end
end


class SelfFollowingError < StandardError
    def initialize(subject_user_id,object_user_id)
      msg = "You may not follow or unfollow yourself"
      super(msg)
    end
end

class AlreadyFollowingError < StandardError
    def initialize(subject_user_id,object_user_id)
      msg = "#{User.find_by(id: subject_user_id).account} is already following #{User.find_by(id: object_user_id).account}"
      super(msg)
    end
end

class NotFollowingError < StandardError
    def initialize(subject_user_id,object_user_id)
      msg = "#{User.find_by(id: subject_user_id).account} is not following #{User.find_by(id: object_user_id).account}"
      super(msg)
    end
end