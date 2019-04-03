class Triplet
  def self.where(min_factor: 0, sum: nil, max_factor:)
    (min_factor..max_factor)
      .to_a.combination(3)
      .map { |(a, b, c)| new(a, b, c) }
      .filter(&:pythagorean?)
      .filter { |triplet| sum.nil? || sum == triplet.sum }
  end

  def initialize(a, b, c) # rubocop:disable Naming/UncommunicativeMethodParamName
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    right_triangle? && coprime?
  end

  private

  attr_reader :a, :b, :c

  def coprime?
    a < b && b < c
  end

  def right_triangle?
    a**2 + b**2 == c**2
  end
end
