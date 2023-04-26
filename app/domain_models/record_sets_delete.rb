class RecordSetsDelete

    attr_accessor :id
    
    def initialize(id)
        @id = id
    end

    def delete_set_record
        set_record = SetsRecord.find_by(id: id)
        if set_record
          set_record.destroy
        else
          raise "Set record not found"
        end
    end
end
