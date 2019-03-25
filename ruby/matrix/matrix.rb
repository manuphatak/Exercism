class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map { |row| row.split(' ').map(&:to_i) }
    @columns = rows.transpose
  end
end
