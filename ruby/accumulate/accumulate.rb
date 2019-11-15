module Accumulate
  refine Array do
    def accumulate
      if block_given?
        self.class.new.tap do |result|
          each { |item| result << yield(item) }
        end
      else
        self
      end
    end
  end
end
