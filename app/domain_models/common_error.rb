# User Login
class NoUserError < StandardError
    def initialize(account_number)
    msg = "There is no #{account_number} user."
    super(msg)
    end
end

class WrongPasswordError < StandardError
    def initialize
    msg = "Password is wrong."
    super(msg)
    end
end

class NoIdError < StandardError
    def initialize
        msg = "Record ID does not exist."
        super(msg)
    end
end


# Content
class NoContentError < StandardError
    def initialize
        msg = "The content input is invalid, please modify it."
        super(msg)
    end
end

# Param
class SameParamsError < StandardError
    def initialize
        msg = "Your new update is same as the former one."
        super(msg)
    end
end


# Set
class NoSetError < StandardError
    def initialize(set)
        msg = "Your input: #{set} is invalid, please modify it."
        super(msg)
    end
end

class NoRepError < StandardError
    def initialize(rep)
        msg = "Your input: #{rep} is invalid, please modify it."
        super(msg)
    end
end

class NoWeightError < StandardError
    def initialize(weight)
        msg = "Your input: #{weight} is invalid, please modify it."
        super(msg)
    end
end

# Time

class NoDurationError < StandardError
    def initialize(duration)
        msg = "Your input: #{duration} is invalid, please modify it."
        super(msg)
    end
end

class NoDistanceError < StandardError
    def initialize(distance)
        msg = "Your input: #{distance} is invalid, please modify it."
        super(msg)
    end
end