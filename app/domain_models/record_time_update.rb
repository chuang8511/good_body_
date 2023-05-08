require_relative 'common_error'

class RecordTimeUpdate

   attr_accessor :id, :contents, :duration, :distance, :time_record
    
   def initialize(id, contents, duration, distance)
       @id           = id
       @contents     = contents
       @duration     = duration
       @distance     = distance
       @time_record  = TimesRecord.find_by(id: id)
   end 

   def update_time_record 
      no_record_found!
      content_not_valid!
      duration_not_valid!
      distance_not_valid!
      content_is_same!
      update_time_succeed
   end

   private

   def no_record_found!
      raise NoIdError.new if time_record.blank?
   end

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

   def content_is_same!
      if time_record.contents == contents && @time_record.duration == duration && @time_record.distance == distance
         raise SameParamsError.new
      end
   end

   def update_time_succeed
      RecordTimeRepository.update(time_record, contents, duration, distance)
   end
end

