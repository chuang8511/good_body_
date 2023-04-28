class RecordTimeDelete

    attr_accessor :id, :time_record
     
    def initialize(id)
      @id = id
      @time_record = TimesRecord.find_by(id: id)
    end 
 
    def delete_time_record #刪除現存的紀錄
      no_record_found!

      
       if time_record != nil
          time_record.destroy
       else
          raise "Time Record not found"
       end
    end 
 
 end