class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase
      .downcase
      .scan(/(?:\w|(?<=\w)'(?=\w))+/)
      .reduce(Counter.new) { |counter, word| counter.inc(word) }
      .counter
  end

  private

  attr_reader :phrase

  class Counter
    attr_accessor :counter

    def initialize
      @counter = Hash.new(0)
    end

    def inc(value)
      counter[value] = counter[value] + 1
      self
    end
  end
end
