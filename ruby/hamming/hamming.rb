module Hamming
  def self.compute(left, right)
    raise ArgumentError if left.length != right.length

    left.chars.zip(right.chars).count { |(a, b)| a != b }
  end
end
