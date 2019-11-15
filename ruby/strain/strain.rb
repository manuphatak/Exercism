module Strain
  refine Array do
    def keep
      [].tap do |array|
        each { |item| array << item if yield item }
      end
    end

    def discard
      [].tap do |array|
        each { |item| array << item unless yield item }
      end
    end
  end
end
