module Hamming
  def self.compute(left, right)
    if left.length != right.length
      raise(ArgumentError, 'Expecting strands of equal length.')
    end

    left.chars.zip(right.chars).count { |(a, b)| a != b }
  end
end
