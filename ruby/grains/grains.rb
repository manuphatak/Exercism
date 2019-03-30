module Grains
  def self.square(number)
    raise ArgumentError if number <= 0 || number > 64

    2**(number - 1)
  end

  def self.total
    64.times.map { |n| square(n + 1) }.sum
  end
end
