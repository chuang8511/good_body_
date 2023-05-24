require_relative 'common_error'

class RecordTimeDelete

   attr_accessor :id, :time_record
     
   def initialize(id)
      @id          = id
      @time_record = TimesRecord.find_by(id: id)
   end 
 
   def delete_time_record 
      no_record_found!
      delete_time_succeed
   end

   private

   def no_record_found!
      raise NoIdError.new if time_record.blank?
   end

   def delete_time_succeed
      RecordTimeRepository.delete(time_record)
   end
    
 end


