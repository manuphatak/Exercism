class Isogram
  IGNORED_CHARACTERS = [' ', '-'].freeze

  def self.isogram?(input)
    new(input).isogram?
  end

  def initialize(input)
    @input = input
  end

  def isogram?
    countable_characters.uniq.length == countable_characters.length
  end

  private

  attr_reader :input

  def countable_characters
    @countable_characters ||=
      input.downcase.split('').reject { |c| IGNORED_CHARACTERS.include? c }
  end
end
