module ArmstrongNumbers
  def self.include?(number)
    ArmstrongNumber.valid?(number)
  end
end

class ArmstrongNumber
  attr_reader :number

  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number
  end

  def valid?
    number == digits.map { |n| n**digits.length }.sum
  end

  private

  def digits
    @digits ||= number.to_s.split('').map(&:to_i)
  end
end
