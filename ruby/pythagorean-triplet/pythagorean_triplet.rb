class Triplet
  def self.where(min_factor: 0, sum: :*, max_factor:)
    (min_factor..max_factor)
      .to_a.combination(3)
      .map { |(a, b, c)| new(a, b, c) }
      .filter(&:pythagorean?)
      .filter { |triplet| sum == :* || sum == triplet.sum }
  end

  def initialize(a, b, c)
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
    Math.sqrt(a**2 + b**2) == c && a < b && b < c
  end

  private

  attr_reader :a, :b, :c
end
