class Luhn
  def self.valid?(input)
    new(input).valid?
  end

  def initialize(input)
    @input = input

  end

  def valid?
    valid_chars? && digits.length > 1 && digits.sum % 10 == 0
  end

  private

  attr_reader :input

  def valid_chars?
    /^[\d\s]+$/ =~ input
  end

  def digits
    @digits ||= input.scan(/\d/).reverse.map.with_index { |n, i| digit(n.to_i, i)}.reverse
  end
end


# TODO class factory
def digit(n, i)
  if i % 2  == 0
    n
  else
    if n > 4
      n * 2 - 9
    else
      n * 2
    end
  end
end