require_relative 'common_error'

class RecordTimeCreate

    attr_accessor :user_id, :contents, :duration, :distance #:user
    
    def initialize(user_id, contents, duration, distance)
        @user_id             = user_id
        @contents            = contents
        @duration            = duration
        @distance            = distance
    end 

    def create_time_record #新增time-based的健身紀錄
        content_not_valid!
        duration_not_valid!
        distance_not_valid!
        record_time_succeed
    end

    private

    def content_not_valid! 
        raise NoContentError.new if contents.blank? 
    end

    def duration_not_valid!
        if duration.blank? || duration.negative? || duration == 0 || duration > 1440 #時間不應該超過一天(1440分鐘)
            raise NoDurationError.new(duration)
        end
    end

    def distance_not_valid!
        raise NoDistanceError.new(distance) if distance.negative?
    end

    def record_time_succeed
        RecordTimeRepository.create(user_id, contents, duration, distance)
    end
end