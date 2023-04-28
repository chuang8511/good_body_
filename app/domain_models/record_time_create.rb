class RecordTimeCreate

    attr_accessor :user_id, :contents, :duration, :distance, :user
    
    def initialize(user_id, contents, duration, distance)
        @user_id             = user_id
        @contents            = contents
        @duration            = duration
        @distance            = distance
        @user                = User.find_by(id: user_id)
        # @record_time_done = false
    end 

    def create_time_record #新增time-based的健身紀錄
        no_user_found!
        content_not_valid!
        duration_not_valid!
        distance_not_valid!
        record_time_succeed
    end

    private

    def no_user_found!
        raise NoUserError.new if user.blank?
    end

    def content_not_valid! 
        raise UnvalidContentError.new if contents.blank? 
    end

    def duration_not_valid!
        if duration.blank? || duration.negative? || duration == 0 || duration > 1440 #時間不應該超過一天(1440分鐘)
            raise UnvalidDurationError.new
        end
    end

    def distance_not_valid!
        raise UnvalidDistanceError.new if distance.negative?
    end

    def record_time_succeed
        #@record_time_done = true #不確定這個的意義
        RecordTimeRepository.succeed_to_create(user_id, contents, duration, distance)
    end
end


class NoUserError < StandardError
    def initialize
        msg = "User does not exist"
        super(msg)
    end
end

class UnvalidContentError < StandardError
    def initialize
        msg = "Your content is not valid"
        super(msg)
    end
end

class UnvalidDurationError < StandardError
    def initialize
        msg = "Your time period is not valid"
        super(msg)
    end
end

class UnvalidDistanceError < StandardError
    def initialize
        msg = "Your distance is not valid"
        super(msg)
    end
end

