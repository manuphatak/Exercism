class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    triangle? && sides.uniq.length == 1
  end

  def isosceles?
    triangle? && sides.uniq.length <= 2
  end

  def scalene?
    triangle? && sides.uniq.length == 3
  end

  private

  attr_reader :sides

  def triangle?
    sides.all?(&:positive?) && satisfies_inequality?
  end

  def satisfies_inequality?
    sides.min(2).sum >= sides.max
  end
end
