module Transpose
  module WithPad
    refine Array do
      def rjust(size, value)
        dup.fill(value, length...size)
      end

      def fill_spaces(line_lengths, index)
        longest_line_to_the_right = line_lengths[(index + 1)..-1].max

        rjust(longest_line_to_the_right, ' ')
          .rjust(line_lengths.max, '')
      end
    end
  end

  using WithPad

  def self.transpose(input)
    lines = input.split("\n")
    line_lengths = lines.map(&:length)
    to_grid = ->(line, i) { line.each_char.to_a.fill_spaces(line_lengths, i) }

    lines
      .map.with_index(&to_grid)
      .transpose
      .map(&:join)
      .join("\n")
  end
end
