class SumOfMultiples
  def initialize(*targets)
    @targets = targets
  end

  def to(value)
    multiples(value).sum
  end

  def multiples(value)
    (1...value).filter(&method(:multiple?))
  end

  private

  attr_reader :targets

  def multiple?(value)
    targets.any? { |target| (value % target).zero? }
  end
end
