class RecordSetsFunctions

    attr_accessor :functions, :user_id, :contents, :sets, :reps, :weight, :record_sets_id
    
    def initialize(functions,account, contents, sets, reps, weight)
        @functions = functions
        @user_id = user_id
        @contents = contents
        @sets = sets
        @reps = reps
        @weight = weight
    end

    def set_functions
        case functions
        when "create"
            create_setrecord
        when "update"
            update_setrecord
        when "delete"
            delete_setrecord
        when "view"
            view_setrecord
        else
          raise "Invalid function"
        end
    end

    def create_setrecord
        SetsRecord.create!(
            user_id: user_id,
            contents: contents,
            sets: sets,
            reps: reps,
            weight: weight
          )
    end

    def update_setrecord (contents, sets, reps, weight)
        set_record = SetsRecord.find_by(id: record_set_id, user_id: user_id)
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

    def delete_setrecord
        set_record = SetsRecord.find_by(id: record_set_id, user_id: user_id)
        if set_record
          set_record.destroy
        else
          raise "Set record not found"
        end
    end


    def view_setrecord
        SetsRecord.find_by(id: record_set_id, user_id: user_id)
    end

end
