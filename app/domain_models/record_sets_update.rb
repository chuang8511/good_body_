class RecordSetsUpdate

    attr_accessor :id, :contents, :sets, :reps, :weight

    def initialize(id, contents, sets, reps, weight)
        @id = id
        @contents = contents
        @sets = sets
        @reps = reps
        @weight = weight
    end

    def update_set_record
        set_record = SetsRecord.find_by(id: id)
        
        if set_record
            set_record.update!(
                contents: contents,
                sets: sets,
                reps: reps,
                weight: weight
            )        
        else
            raise "Set record not found"
        end

    end

end