class DataFrame
  module Structure
    include Validation
    include Columns
    include Display

    def initialize arg
      @cols = {}

      case arg
      when self.class
        copy_instance_variables_from other
      when Array
        add_columns Util::HashTranspose[arg]
      when Hash
        add_columns arg
      end
    end

    def initialize_copy other
      super
      copy_instance_variables_from other
    end

    def initialize_dup *args
      initialize_copy *args
    end

    def initialize_clone *args
      initialize_copy *args
    end

    private

    def copy_instance_variables_from other
      other.instance_variables.each do |iv|
        conditional_dup = ->(obj) do
          can_duplicate   = obj.respond_to?(:dup)
          can_duplicate &&= obj.respond_to?(:duplicable?) ? obj.duplicable? : true
          can_duplicate ? obj.dup : obj
        end

        instance_variable_set iv,
          iv.respond_to?(:collect) ? iv.collect(&conditional_dup) : iv.dup
      end
    end

  end # end module Structure
end # end class DataFrame

