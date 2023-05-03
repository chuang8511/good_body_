class InfoIdentification


    def initialize()

    end

    def age_testify(age)
        if age < 130 and age > 2
            return age
        else
            raise WrongAge.new()
        end
    end

    def weight_testify(age)
        if age < 600 and age >  10
            return age
        else
            raise WrongWeight.new()
        end
    end

    def height_testify(age)
        if age < 280 and age > 70
            return age
        else
            raise WrongHeight.new()
        end
    end

end



# todo: It would be better to arrange in another place.
class WrongWeight < StandardError
        def initialize()
            msg = "wrong weight"
            super(msg)
        end
end
  
class WrongHeight < StandardError
        def initialize()
            msg = "wrong height"
            super(msg)
        end
end
  
class WrongAge < StandardError
    def initialize()
        msg = "wrong age"
        super(msg)
    end
end


