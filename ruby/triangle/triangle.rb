class Triangle
  def initialize(sides)
    @a = sides[0]
    @b = sides[1]
    @c = sides[2]
  end

  def equilateral?
    triangle? && a == b && b == c
  end

  def isosceles?
    triangle? && (a == b || b == c || c == a)
  end

  def scalene?
    triangle? && (a != b && b != c)
  end

  private

  attr_reader :a, :b, :c

  def triangle?
    [a, b, c].all?(&:positive?) && combinations.all? { |(a, b, c)| a + b >= c }
  end

  def combinations
    [[a, b, c], [b, c, a], [c, a, b]]
  end
end
