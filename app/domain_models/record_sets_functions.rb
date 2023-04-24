class RecordSetsFunctions

    attr_accessor :functions,:user_id, :user, :contents, :sets, :reps, :weight

    def initialize(functions,account, contents, sets, reps, weight)
        @user = User.find_by(account: account)
        @user_id =user&.id
            # if @user
            #     @user_id = user.id #why????????
            # else
            #     "Something goes wrong"
            # end
        @functions = functions
        @contents = contents
        @sets = sets
        @reps = reps
        @weight = weight
    end

    def set_functions
        case functions
        when "add"
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
        

    end

    def delete_setrecord



    end

    def view_setrecord



    end


    

end
