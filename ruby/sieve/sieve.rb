class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    pointer = 0

    mark_primes(pointer += 1) while in_range?(pointer)

    numbers
  end

  private

  attr_reader :limit

  def numbers
    @numbers ||= (2..limit).to_a
  end

  def mark_primes(index)
    step = numbers[index]
    ((step * 2)..limit).step(step).each { |n| numbers.delete(n) }
  end

  def in_range?(pointer)
    numbers.length <= pointer
  end
end
