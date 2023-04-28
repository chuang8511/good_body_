class RecordTimeRepository
    class << self

        def create(user_id, contents, duration, distance)
            TimesRecord.create!(user_id: user_id, contents: contents, duration: duration, distance: distance)
        end

        def delete(id)
            TimesRecord.destroy(id)
        end

        def update(time_record, contents, duration, distance)
            time_record.update!(contents: contents, duration: duration, distance: distance)
        end
    end
end