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


# # 檢視健身紀錄
# get do
#     record_function = RecordSetsView.new(params[:user_id])
#     record_function.view_set_record
#   end


#     def view_set_record
#         SetsRecord.find_by(user_id: user_id)
#     end

# end
