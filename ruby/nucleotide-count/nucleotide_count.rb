class Nucleotide
  TYPES = %w[A C G T].freeze

  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    raise ArgumentError unless dna.chars.all? { |c| TYPES.include?(c) }

    @dna = dna
  end

  def count(nucleotide)
    dna.chars.count { |c| nucleotide == c }
  end

  def histogram
    TYPES.each_with_object({}) { |type, hash| hash[type] = count(type) }
  end

  private

  attr_reader :dna
end
