class InvalidCodonError < StandardError; end
class Translation
PROTEINS = { 'Methionine' => ['AUG'],
             'Phenylalanine' => ['UUU', 'UUC'],
             'Leucine' => ['UUA', 'UUG'],
             'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
             'Tyrosine' => ['UAU', 'UAC'], 
             'Cysteine' => ['UGU', 'UGC'],
             'Tryptophan' => ['UGG'],
             'STOP' => ['UAA', 'UAG', 'UGA'] }
             
  def self.of_codon(codon)
    PROTEINS.keys.each { |name| return name if PROTEINS[name].include?(codon) }
  end

  def self.of_rna(strand)
    fail InvalidCodonError, 'invalid codon' if strand.match(/[^AUGC]/)
    codon_array, protein_array = [], []
    codon_array << strand.slice!(0..2) while !strand.empty?
    codon_array.each do |codon| 
      protein = of_codon(codon)
      protein == "STOP" ? break : protein_array << protein
    end
    protein_array
  end
end
