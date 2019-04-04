module Prime
  class << self
    def nth(n) # rubocop:disable Naming/UncommunicativeMethodParamName
      raise ArgumentError if n <= 0 || n > 10_001

      Sieve.new(range(n)).primes[n - 1]
    end

    private

    def range(n) # rubocop:disable Naming/UncommunicativeMethodParamName, Metrics/MethodLength
      if n <= 4
        10
      elsif n <= 25
        100
      elsif n <= 168
        1000
      elsif n <= 1229
        10_000
      else
        100_000
      end
    end
  end

  class Sieve
    def initialize(limit)
      @limit = limit
    end

    def primes
      set = (2..@limit).to_a
      (2..@limit).each do |i|
        set.reject! { |j| j > i && (j % i).zero? }
      end
      set
    end
  end
end
