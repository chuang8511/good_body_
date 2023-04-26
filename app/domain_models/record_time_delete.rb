class RecordTimeDelete

    attr_accessor :id
     
    def initialize(id)
        @id = id
    end 
 
    def delete_time_record #刪除現存的紀錄
       time_record = TimesRecord.find_by(id: id)
       if time_record != nil
          time_record.destroy
       else
          raise "Time Record not found"
       end
    end 
 
 end