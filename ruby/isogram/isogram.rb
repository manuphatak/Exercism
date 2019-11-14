class Isogram
  IGNORED_CHARACTERS = [' ', '-'].freeze

  def self.isogram?(input)
    new(input).isogram?
  end

  def initialize(input)
    @input = input
  end

  def isogram?
    repeating_characters.empty?
  end

  def repeating_characters
    countable_characters
      .each_with_object(Hash.new(0)) { |char, counter| counter[char] += 1 }
      .select { |_, count| count > 1 }.keys
  end

  private

  attr_reader :input

  def countable_characters
    input.downcase.split('').reject { |char| IGNORED_CHARACTERS.include? char }
  end
end
