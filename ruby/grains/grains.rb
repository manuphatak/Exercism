module Grains
  def self.square(number)
    raise ArgumentError if number <= 0 || number > 64

    2**(number - 1)
  end

  def self.total
    18_446_744_073_709_551_615
  end
end
