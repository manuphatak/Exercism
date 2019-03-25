class Squares
  private

  attr_reader :length

  public

  def initialize(length)
    @length = length
  end

  def square_of_sum
    (0..length).sum**2
  end

  def sum_of_squares
    (0..length).map { |n| n**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
