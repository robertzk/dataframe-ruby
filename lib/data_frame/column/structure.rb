class DataFrame
  class Column
    module Structure
      extend Forwardable
      # TODO: (RK) Note these operations do not leave class intact..
      def_delegators :@values, *(Array.instance_methods - Class.new.methods)

    end
  end
end
