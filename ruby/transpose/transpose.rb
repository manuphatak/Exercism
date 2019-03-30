require 'pry'

module Transpose
  def self.transpose(input)
    lines = input.split("\n")
    line_length = lines.map(&:length).max

    lines
      .map { |line| line.ljust(line_length).each_char.to_a }
      .transpose
      .map(&:join)
      .join("\n")
      .rstrip
  end
end
