class Anagram
  def initialize(test_word)
    @test_word = test_word
  end

  def match(candidates)
    candidates.filter(&method(:match?))
  end

  private

  attr_reader :test_word

  def match?(candidate)
    !identical?(candidate) && sorted_chars(test_word) == sorted_chars(candidate)
  end

  def identical?(candidate)
    test_word.casecmp(candidate).zero?
  end

  def sorted_chars(word)
    word.downcase.each_char.sort
  end
end
