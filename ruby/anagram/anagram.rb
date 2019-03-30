class Anagram
  def initialize(test_word)
    @test_word = test_word
  end

  def match(candidates)
    candidates.select(&method(:match?))
  end

  private

  attr_reader :test_word

  def match?(candidate)
    !test_word.casecmp(candidate).zero? &&
      test_word.downcase.each_char.sort == candidate.downcase.each_char.sort
  end
end
