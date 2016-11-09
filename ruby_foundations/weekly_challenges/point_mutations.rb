class DNA
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(mutation)
    short, long = [@strand, mutation].sort_by(&:size)
    short.chars.select.with_index { |letter, idx| letter != long[idx] }.count
  end
end
