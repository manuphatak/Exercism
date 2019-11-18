require 'minitest/autorun'
require_relative 'palindrome_products'

class FactorableNumberTest < Minitest::Test
  def test_has_value
    factor = FactorableNumber.new(9)
    assert_equal 9, factor.value
  end

  def test_has_factors
    factor = FactorableNumber.new(9)
    assert_includes [[[3, 3], [1, 9]], [[1, 9], [3, 3]]], factor.factors
  end
end

class PalindromesTest < Minitest::Test
  def test_generating_palindrome_products
    palindromes = Palindromes.new(max_factor: 9)
    assert_equal palindromes.generate, [1, 2, 3, 4, 5, 6, 7, 8, 9].sort
  end

  def test_largest_palindrome_from_single_digit_factors
    palindromes = Palindromes.new(max_factor: 9)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 9, largest.value
    assert_includes [[[3, 3], [1, 9]], [[1, 9], [3, 3]]], largest.factors
  end

  def test_largest_palindrome_from_double_digit_factors
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 9009, largest.value
    assert_equal [[91, 99]], largest.factors
  end

  def test_smallest_palindrome_from_double_digit_factors
    palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 121, smallest.value
    assert_equal [[11, 11]], smallest.factors
  end

  def test_largest_palindrome_from_triple_digit_factors
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    largest = palindromes.largest
    assert_equal 906_609, largest.value
    assert_equal [[913, 993]], largest.factors
  end

  def test_smallest_palindrome_from_triple_digit_factors
    palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
    palindromes.generate
    smallest = palindromes.smallest
    assert_equal 10_201, smallest.value
    assert_equal [[101, 101]], smallest.factors
  end
end
