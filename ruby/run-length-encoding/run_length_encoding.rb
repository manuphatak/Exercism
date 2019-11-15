module RunLengthEncoding
  def self.encode(input)
    input
      .split('')
      .slice_when { |l, r| l != r }
      .map { |chunk| Encoder.for(chunk) }
      .join
  end

  def self.decode(input)
    input
      .split('')
      .slice_after(/[a-zA-Z\s]/)
      .map { |chunk| Decoder.for(chunk) }
      .join
  end
end

class Encoder
  def self.for(chunk)
    new(chunk.to_a)
  end

  def initialize(chunk)
    @chunk = chunk
  end

  def to_s
    "#{run_length}#{character}"
  end

  private

  attr_reader :chunk

  def run_length
    chunk.length if chunk.length > 1
  end

  def character
    chunk.first
  end
end

class Decoder
  def self.for(chunk)
    new(*chunk.to_a)
  end

  def initialize(*count_digits, character)
    @character = character
    @count = if count_digits.empty?
               1
             else
               count_digits.join.to_i
             end
  end

  def to_s
    character * count
  end

  private

  attr_reader :character, :count
end
