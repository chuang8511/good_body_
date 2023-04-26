class RecordSetsCreate

    attr_accessor :user_id, :contents, :sets, :reps, :weight

    def initialize(user_id, contents, sets, reps, weight)
        @user_id = user_id
        @contents = contents
        @sets = sets
        @reps = reps
        @weight = weight
    end

    def create_set_record
        # max_record_set_id = SetsRecord.maximum(:record_set_id) || 0
        # next_record_set_id = max_record_set_id + 1       
        SetsRecord.create!(
            user_id: user_id,
            contents: contents,
            sets: sets,
            reps: reps,
            weight: weight
        )
    end
end


# class RecordSetsUpdate
#     def update_set_record
#         set_record = SetsRecord.find_by(id: id)
#         if set_record

#             set_record.update!(
#               contents: contents,
#               sets: sets,
#               reps: reps,
#               weight: weight
#             )

#             raise 'It is a true context'
            
#         else
#             raise "Set record not found"
#         end
#     end

    
#     def delete_set_record
#         set_record = SetsRecord.find_by(record_set_id: record_set_id)
#         if set_record
#           set_record.destroy
#         else
#           raise "Set record not found"
#         end
#     end


#     def view_set_record
#         SetsRecord.find_by(record_set_id: record_set_id, user_id: user_id)
#     end

# end
