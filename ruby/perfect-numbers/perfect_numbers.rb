class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 1

    new(number).classify
  end

  def initialize(number)
    @number = number
  end

  def classify
    case factors.sum <=> number
    when -1
      'deficient'
    when 0
      'perfect'
    when 1
      'abundant'
    end
  end

  def factors
    (1...number).filter { |n| (number % n).zero? }
  end

  private

  attr_reader :number
end
