class DataFrame
  module Structure
    module Validation

      protected

      def validate!
        self.methods.grep(/^validate_/i).each(&method(:send))
      end

      def validate_values_is_enumerable
        unless values.is_a? required = Enumerable
          raise TypeError, "%s expects %s, instead got a %s" % [
            self.class, required, values.class].map(&:name)
        end
      end

      def validate_values_are_of_homogeneous_type
        # TODO: (RK) Check minimal ancestor intersection.
      end
    end
  end
end

