module Complement
  DNA_RNA_MAP = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(dna)
    dna.chars.map { |nucleotide| DNA_RNA_MAP[nucleotide] }.join
  end
end
