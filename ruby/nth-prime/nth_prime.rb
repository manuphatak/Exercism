module Prime
  def self.nth(n) # rubocop:disable Naming/UncommunicativeMethodParamName
    raise ArgumentError if n <= 0 || n > 10_001

    Sieve.new(100_000).primes[n - 1]
  end

  class Sieve
    def initialize(limit)
      @upper = limit * (Math.log(limit) + 2)
    end

    def primes
      (2..Math.sqrt(upper))
        .each_with_object([nil, nil] + [*2..upper]) do |i, primes|
          (i**2).step(upper, i) { |j| primes[j] = nil } if primes[i]
        end
        .compact
    end

    private

    attr_reader :upper
  end
end
