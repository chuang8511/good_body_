class RecordTimeUpdate

   attr_accessor :id, :contents, :duration
    
   def initialize(id, contents, duration)
       @id = id
       @contents = contents
       @duration = duration
   end 

   def update_time_record
      time_record = TimesRecord.find_by(id: id)
      if time_record != nil
         time_record.update!(contents: contents, duration: duration)
      else
         raise "Time Record not found"
      end
   end 

end