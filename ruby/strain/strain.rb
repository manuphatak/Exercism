module Strain
  refine Array do
    def keep
      self.class.new.tap do |array|
        each { |item| array << item if yield item }
      end
    end

    def discard
      self.class.new.tap do |array|
        each { |item| array << item unless yield item }
      end
    end
  end
end
