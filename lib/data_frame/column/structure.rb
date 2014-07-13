class DataFrame
  class Column
    module Structure
      extend Forwardable
      def_delegators :@values, *(Array.instance_methods - Class.new.methods)

    end
  end
end
