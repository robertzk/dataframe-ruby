class DataFrame
  module Structure
    module Columns
      attr_reader :cols

      def add_columns array
        array.each { |(name, values)| add_column(name, values) }
      end

      def add_column name, values
        values = Column.new values unless Column === values
        @cols[name] = values
        # TODO: (RK) Validate same length.
      end

      def nrow
        cols.values.first.length
      rescue
        0
      end

    end
  end
end

