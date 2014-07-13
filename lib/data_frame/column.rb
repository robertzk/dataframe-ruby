class DataFrame
  class Column
    include Structure
    include Validation
    include Display

    attr_reader :values

    def initialize values
      @values = values
      validate!
    end

  end
end
