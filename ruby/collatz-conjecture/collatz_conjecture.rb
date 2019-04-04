module CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError unless number.positive?
    return count if number == 1

    steps next_collatz(number), count + 1
  end

  def self.next_collatz(number)
    number.odd? ? 3 * number + 1 : number / 2
  end
end
