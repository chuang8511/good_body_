class RecordTimeRepository
    class << self

        def succeed_to_create(user_id, contents, duration, distance)
            TimesRecord.create!(user_id: user_id, contents: contents, duration: duration, distance: distance)
        end

    end
end