class Nucleotide
  TYPES = %w[A C G T].freeze

  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    @dna_chars = dna.chars

    raise ArgumentError unless dna_chars.all? { |c| TYPES.include?(c) }
  end

  def count(nucleotide)
    dna_chars.count(nucleotide)
  end

  def histogram
    TYPES.each_with_object({}) { |type, hash| hash[type] = count(type) }
  end

  private

  attr_reader :dna_chars
end
