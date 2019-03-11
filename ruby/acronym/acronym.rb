module Acronym
  def self.abbreviate(long_name)
    long_name.scan(/\b[a-zA-Z]/).join.upcase
  end
end
