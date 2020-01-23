class Luhn
  def self.valid?(input)
    new(input).valid?
  end

  def initialize(input)
    @input = input
  end

  def valid?
    valid_chars? && digits.length > 1 && (digits.sum(&:value) % 10).zero?
  end

  private

  attr_reader :input

  def valid_chars?
    /^[\d\s]+$/ =~ input
  end

  def input_digits
    @input_digits ||= input.scan(/\d/)
  end

  def digits
    @digits ||= input_digits.map.with_index do |n, i|
      digit_for(n.to_i, i, input_digits.length)
    end
  end

  def digit_for(number, index, size)
    if (index.even? && size.even?) || (index.odd? && size.odd?)
      DoubleDigit
    else
      Digit
    end.new(number)
  end

  class Digit
    attr_reader :number

    def initialize(number)
      @number = number
    end

    alias value number
  end

  class DoubleDigit < Digit
    def value
      if number > 4
        number * 2 - 9
      else
        number * 2
      end
    end
  end
end
