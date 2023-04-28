class RecordSetsCreate

    attr_accessor :user_id, :user, :content, :set, :rep, :weight

    def initialize(user_id, content, set, rep, weight)
        @user_id = user_id
        @content = content
        @set = set
        @rep = rep
        @weight = weight
        @user = User.find_by(id: user_id)
    end

    def create_set_record
        user_not_found!
        content_is_wrong!
        set_is_wrong!
        rep_is_wrong!
        weight_is_wrong!
        succeed_to_create_set
    end

    private

    def user_not_found!
        raise NoUseridError.new(user_id) if user.blank?
    end

    def content_is_wrong!
        raise NoContentError.new(content) if content.blank?
    end

    def set_is_wrong!
        raise NoSetError.new(set) if set.blank? || set == 0 || set.negative? || set > 100
    end

    def rep_is_wrong!
        raise NoRepError.new(rep) if rep.blank? || rep == 0 || rep.negative? || rep > 100
    end

    def weight_is_wrong!
        raise NoWeightError.new(weight) if weight.blank? || weight ==0 || weight.negative? || weight > 300

    end
    
    def succeed_to_create_set
        RecordSetRepository.create_set_record(user_id, content, set, rep, weight)
    end

end

class NoUseridError < StandardError
    def initialize(user_id)
        msg = "The user ID: #{user_id} isn't existed."
        super(msg)
    end
end

class NoContentError < StandardError
    def initialize(content)
        msg = "Your input: #{content} is a wrong format, please modify it."
        super(msg)
    end
end

class NoSetError < StandardError
    def initialize(set)
        msg = "Your input: #{set} is a wrong format, please modify it."
        super(msg)
    end
end

class NoRepError < StandardError
    def initialize(rep)
        msg = "Your input: #{rep} is a wrong format, please modify it."
        super(msg)
    end
end

class NoWeightError < StandardError
    def initialize(weight)
        msg = "Your input: #{weight} is a wrong format, please modify it."
        super(msg)
    end
end

