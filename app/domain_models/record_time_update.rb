class RecordTimeUpdate

   attr_accessor :id, :contents, :duration, :distance, :time_record
    
   def initialize(id, contents, duration, distance)
       @id           = id
       @contents     = contents
       @duration     = duration
       @distance     = distance
       @time_record  = TimesRecord.find_by(id: id)
   end 

   def update_time_record #修改現有的紀錄
      no_record_found!
      content_not_valid!
      duration_not_valid!
      distance_not_valid!
      content_is_same!
      update_time_succeed
   end

   private

   def no_record_found!
      raise NoRecordError.new(id) if time_record.blank?
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

   def content_is_same!
      if time_record.contents == contents && @time_record.duration == duration && @time_record.distance == distance
         raise SameContentError.new
      end
   end

   def update_time_succeed
      RecordTimeRepository.update(time_record, contents, duration, distance)
   end
end

class NoRecordError < StandardError
   def initialize(id)
       msg = "Can't find the record: #{id}"
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

class SameContentError < StandardError
   def initialize
      msg = "Your input is exactly the same as the original record"
      super(msg)
   end
end