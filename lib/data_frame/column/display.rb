class DataFrame
  class Column

    module Display
      extend Forwardable
      def_delegator :@values, :to_s

      def inspect
        "%s with %d entr%s%s\n%s" %
          [self.class.name, values.length,
           values.length == 1 ? "y" : "ies",
           (" of type %s" % values.first.class.name if values.length > 0),
           (to_s if values.length > 0)
          ]
      end

    end

  end
end
