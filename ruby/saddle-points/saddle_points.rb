class Matrix
  def initialize(input)
    @input = input
  end

  def rows
    @rows ||= input.split("\n").map { |row| row.split(' ').map(&:to_i) }.freeze
  end

  def columns
    @columns ||= rows.transpose.freeze
  end

  def saddle_points
    cells.filter { |(y, x)| rows[y].max == columns[x].min }
  end

  private

  attr_reader :input

  def cells
    rows
      .map
      .with_index { |row, y| row.map.with_index { |_value, x| [y, x] } }
      .flatten(1)
  end
end
