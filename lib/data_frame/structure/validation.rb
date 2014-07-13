class DataFrame
  module Structure
    module Validation

      protected

      def validate!
        self.methods.grep(/^validate_/i).each(&method(:send))
      end

      def validate_columns_are_of_same_length
        # TODO: (RK)
      end

    end
  end
end

