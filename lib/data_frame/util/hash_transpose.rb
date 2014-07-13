# Turn things like
#   x = [{a: 1, b: 2}, {a: 3, b: 4}]
# into:
#   { a: [1, 3], b: [2, 4] }
# using
#   HashTranspose[x]
class DataFrame
  module Util
    module HashTranspose
      extend self

      def [] array
        check_arguments array
        keys   = array.map(&:keys).flatten.uniq
        master = keys.map { |key| { key => [] } }.reduce(:merge) || {}
        array.each { |hash| keys.each { |key| master[key] << hash[key] } }
        master
      end

      private

      def check_arguments array
        unless array.all? { |x| Hash === x }
          raise TypeError.new("All values must be hashes")
        end
      end

    end
  end
end
