class RecordSetsFunctions

    attr_accessor :functions, :user_id, :contents, :sets, :reps, :weight, :record_set_id

    def initialize(functions, user_id, contents, sets, reps, weight)
        @functions = functions
        @user_id = user_id
        @contents = contents
        @sets = sets
        @reps = reps
        @weight = weight
        @record_set_id = 0
    end

    def set_functions
        case functions
        when "create"
            create_set_record
        when "update"
            update_set_record
        when "delete"
            delete_set_record
        when "view"
            view_set_record
        else
          raise "Invalid function"
        end
    end

    def create_set_record
        max_record_set_id = SetsRecord.maximum(:record_set_id) || 0
        next_record_set_id = max_record_set_id + 1       
        SetsRecord.create!(
            record_set_id: next_record_set_id,
            user_id: user_id,
            contents: contents,
            sets: sets,
            reps: reps,
            weight: weight
        )
    end

    def update_set_record
        set_record = SetsRecord.find_by(record_set_id: record_set_id)
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

    def delete_set_record
        set_record = SetsRecord.find_by(record_set_id: record_set_id)
        if set_record
          set_record.destroy
        else
          raise "Set record not found"
        end
    end


    def view_set_record
        SetsRecord.find_by(record_set_id: record_set_id, user_id: user_id)
    end

end
