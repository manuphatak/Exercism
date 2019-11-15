module Accumulate
  refine Enumerable do
    def accumulate
      if block_given?
        self.class.new.tap do |copy|
          each { |item| copy << yield(item) }
        end
      else
        enum_for
      end
    end
  end
end
