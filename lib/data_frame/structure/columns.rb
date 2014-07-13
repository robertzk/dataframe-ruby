class DataFrame
  module Structure
    module Columns
      attr_reader :cols

      def add_columns array
        array.each { |(name, values)| add_column(name, values) }
      end

      def add_column name, values
        values = Column.new values unless Column === values

        begin
          name = name.to_sym
        rescue
          raise TypeError, "Argument `name` must respond to `to_sym`"
        end
        
        @cols[name] = values
        
        # TODO: (RK) Validate same length.
      end

      def nrow
        cols.values.first.length
      rescue
        0
      end

      def respond_to? method_name
        return true if cols.keys.include? method_name.to_sym
        super
      end

      def method_missing method_name, *args
        method_name = method_name.to_sym
        if cols.keys.include? method_name
          eigenclass.send(:define_method, method_name) { @cols[method_name] }
          return public_send method_name
        end

        # TODO: (RK) Define ? and = methods for column keys.
        super
      end

    end
  end
end

