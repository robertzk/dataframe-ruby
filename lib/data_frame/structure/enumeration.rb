class DataFrame
  module Structure
    module Enumeration
      extend Forwardable
      include Enumerable

      # TODO: (RK) Note these operations do not leave class intact..
      def_delegators :colvalues, 
        *(Array.instance_methods - (Enumerable.instance_methods + Class.new.methods))
      def_delegator  :colvalues, :each

      def colvalues
        cols.values
      end

    end
  end
end

