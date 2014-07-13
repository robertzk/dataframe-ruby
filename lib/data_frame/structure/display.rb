class DataFrame
  module Structure
    module Display
      extend Forwardable
      # TODO: (RK) Display in tabular format.
      def_delegator :@cols, :to_s

      def inspect
        "%s with %d column%s and %d row%s" %
          [self.class.name,
           cols.length,
           cols.length == 1 ? '' : 's',
           nrow,
           nrow == 1 ? '' : 's'
          ]
      end

    end
  end
end
