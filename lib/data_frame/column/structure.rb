class DataFrame
  class Column
    module Structure
      extend Forwardable
      include Enumerable
      # TODO: (RK) Note these operations do not leave class intact..
      def_delegators :values,
        *(Array.instance_methods - (Enumerable.instance_methods + Class.new.methods))
      def_delegator  :values, :each

    end
  end
end
