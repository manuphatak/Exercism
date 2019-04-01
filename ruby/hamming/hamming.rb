module Hamming
  def self.compute(left, right)
    raise ArgumentError if left.length != right.length

    left.each_char.zip(right.each_char).count { |(a, b)| a != b }
  end
end
