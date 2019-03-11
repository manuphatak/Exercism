module Year
  def self.leap?(year)
    year.divisible_by?(4) &&
      !year.divisible_by?(100) ||
      year.divisible_by?(400)
  end
end

class Integer
  def divisible_by?(number)
    (self % number).zero?
  end
end
