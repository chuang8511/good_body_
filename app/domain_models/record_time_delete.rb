class RecordTimeDelete

   attr_accessor :id, :time_record
     
   def initialize(id)
      @id          = id
      @time_record = TimesRecord.find_by(id: id)
   end 
 
   def delete_time_record #刪除現存的紀錄
      no_record_found!
      delete_time_succeed
   end

   private

   def no_record_found!
      raise NoRecordError.new(id) if time_record.blank?
   end

   def delete_time_succeed
      RecordTimeRepository.delete(time_record)
   end
    
 end

class NoRecordError < StandardError
   def initialize(id)
       msg = "Can't find the record: #{id}"
       super(msg)
   end
end
