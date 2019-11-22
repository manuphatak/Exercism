class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.color_code(color)
    new(color).color_code
  end

  def initialize(color)
    @color = color
  end

  def color_code
    COLORS.find_index(color)
  end

  attr_reader :color
end
