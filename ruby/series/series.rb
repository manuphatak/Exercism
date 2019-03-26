class Series
  def initialize(input)
    @input = input
  end

  def slices(length)
    raise ArgumentError if length > input.length

    (input.length - length + 1).times.to_a.map { |i| input.slice(i, length) }
  end

  private

  attr_reader :input
end
