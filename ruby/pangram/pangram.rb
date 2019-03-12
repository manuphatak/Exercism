module Pangram
  def self.pangram?(sentence)
    ('a'..'z').all? { |letter| sentence.downcase.include?(letter) }
  end
end
