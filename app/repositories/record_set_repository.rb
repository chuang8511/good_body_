class RecordSetRepository

    class << self
  
        def create_set_record(user_id, content, set, rep, weight)
            SetsRecord.create!(
                user_id: user_id,
                contents: content,
                sets: set,
                reps: rep,
                weight: weight
            )
        end

        def update_set_record(id_set, content, set, rep, weight)
            id_set.update!(
                contents: content,
                sets: set,
                reps: rep,
                weight: weight
            )
        end

        def delete_set_record(id_set)
            id_set.destroy
        end

    
    end
  
  
  end