module Pangram
  def self.pangram?(sentence)
    sentence_letters = sentence.downcase.chars.uniq

    ('a'..'z').all? { |letter| sentence_letters.include?(letter) }
  end
end
