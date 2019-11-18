module Palindromic
  refine Integer do
    def palindrome?
      digits == digits.reverse
    end
  end
end

module FactorableUtils
  refine Integer do
    def to_factor_pairs
      (1..self / 2)
        .map { |n| [n, self / n] if (self % n).zero? }
        .compact
        .uniq(&:sort)
    end
  end

  refine Array do
    def within_range(range)
      filter { |pair| pair.all? { |n| range.include?(n) } }
    end
  end
end

class Palindromes
  using Palindromic

  def initialize(min_factor: 1, max_factor:)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    palindrome_products
  end

  def largest
    FactorableNumber.new(palindrome_products.max, range)
  end

  def smallest
    FactorableNumber.new(palindrome_products.min, range)
  end

  private

  attr_reader :max_factor, :min_factor

  def range
    (min_factor..max_factor)
  end

  def palindrome_products
    @palindrome_products ||= possible_products.filter(&:palindrome?)
  end

  def possible_products
    range
      .to_a
      .repeated_combination(2)
      .map { |(a, b)| a * b }
      .uniq
  end
end

class FactorableNumber
  using FactorableUtils

  attr_reader :value

  def initialize(value, range = 1..value)
    @value = value
    @range = range
  end

  def factors
    value.to_factor_pairs.within_range(range)
  end

  private

  attr_reader :range
end
