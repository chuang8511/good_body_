require_relative 'common_error'

class RecordSetsUpdate

    attr_accessor :id, :id_set, :content, :set, :rep, :weight

    def initialize(id, content, set, rep, weight)
        @id = id
        @id_set = SetsRecord.find_by(id: id)
        @content = content
        @set = set
        @rep = rep
        @weight = weight

    end

    def update_set_record
        record_not_found!
        content_is_wrong!
        set_is_wrong!
        rep_is_wrong!
        weight_is_wrong!
        all_params_are_same!
        succeed_to_update_set
    end

    private

    def record_not_found!
        raise NoIdError.new if id_set.blank?
    end

    def content_is_wrong!
        raise NoContentError.new if content.blank?
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

    def all_params_are_same!
        if id_set.contents == content && id_set.sets == set && id_set.reps == rep && id_set.weight == weight
            raise SameParamsError.new
        end
    end

    def succeed_to_update_set
        RecordSetRepository.update_set_record(id_set, content, set, rep, weight)
    end

end
