class RecordSetsDelete

    attr_accessor :id, :id_set
    
    def initialize(id)
        @id = id
        @id_set = SetsRecord.find_by(id: id)
    end

    def delete_set_record
      id_not_found!
      succeed_to_delete_set
    end

    def id_not_found!
      raise NoIdError.new(id) if id_set.blank?
    end

    def succeed_to_delete_set
      RecordSetRepository.delete_set_record(id_set)
    end
    
end


class NoIdError < StandardError
  def initialize(id)
      msg = "The record ID: #{id} isn't existed."
      super(msg)
  end
end