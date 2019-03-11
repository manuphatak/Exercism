module Acronym
  def self.abbreviate(long_name)
    long_name.tr('-', ' ').split.map { |word| word[0] }.join.upcase
  end
end
