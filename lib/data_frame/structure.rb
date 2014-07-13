require 'active_support'

class DataFrame
  module Structure
    include Validation
    include Columns
    include Enumeration
    include Subsetting
    include Display

    def initialize arg = nil
      @cols = ActiveSupport::OrderedHash.new

      allowed_types = []
      type = ->(klass) { (allowed_types << klass).last }
      case arg
      when type[self.class]
        copy_instance_variables_from other
      when type[Array]
        add_columns Util::HashTranspose[arg]
      when type[Hash]
        add_columns arg
      when NilClass
      else
        raise TypeError, "%s#new was given a %s but can only take one of: %s" %
          [self.class.name, arg.class.name, allowed_types.map(&:name).join(', ')]
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

    def eigenclass
      class << self; self; end
    end

    def copy_instance_variables_from other
      other.instance_variables.each do |iv|
        conditional_dup = ->(obj) do
          can_duplicate   = obj.respond_to?(:dup)
          can_duplicate &&= obj.respond_to?(:duplicable?) ? obj.duplicable? : true
          can_duplicate ? obj.dup : obj rescue obj
        end

        # TODO: (RK) This totally fails for hashes.
        instance_variable_set iv,
          if iv.respond_to?(:collect)
            iv.collect(&conditional_dup)
          else
            conditional_dup[iv]
          end
      end
    end

  end # end module Structure
end # end class DataFrame

