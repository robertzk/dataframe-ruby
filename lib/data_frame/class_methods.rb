class DataFrame

  module ClassMethods
    def self.extended(base)
      base.class_eval do
        class << self
          alias [] new
        end
      end
    end
  end

end
