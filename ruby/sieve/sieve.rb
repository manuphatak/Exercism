class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    pointer = 0

    pointer += 1 while mark_primes(pointer)

    numbers
  end

  private

  attr_reader :limit

  def numbers
    @numbers ||= (2..limit).to_a
  end

  def mark_primes(index)
    step = numbers[index]

    ((step * 2)..limit).step(step).each { |n| numbers.delete(n) } if step
  end
end
