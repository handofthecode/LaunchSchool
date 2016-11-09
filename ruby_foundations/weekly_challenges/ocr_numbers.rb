class OCR
  DIGITS = [" _     _  _     _  _  _  _  _ ",
            "| |  | _| _||_||_ |_   ||_||_|",
            "|_|  ||_  _|  | _||_|  ||_| _|"]

  def initialize(input)
    input.include?("\n\n") ? @input = input : single_line(input)
  end

  def convert
    if @input.include?("\n\n")
      process_multi_lines
    else
      (@size/3).times do |input_row|
        ir = input_row * 3
        old_num = @result.dup           ## Just checks first row for a match
        (0..29).step(3) { |r| check(r, ir) if DIGITS[0][r, 3] == @input[0][ir, 3] }
        @result << "?" if old_num == @result
      end
      @result
    end
  end

  protected

  def single_line(input)
    input = input.split("\n")
    @size = ((input[2].size / 3.0).ceil * 3) ## bottom line determines width
    @input = input.map { |s| s << " " * (@size - s.size) }
    @result = ''                ## ^^ makes sure each digit is 3 chars wide
  end

  def check(r, ir)    ## checks remaining two rows to complete the match
    @result << "#{r/3}" if [1, 2].all? { |l| DIGITS[l][r, 3] == @input[l][ir, 3] }
  end

  def process_multi_lines
    @result = ''
    @input.split("\n\n").map {|el| @result << OCR.new(el).convert }
    @result.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  end
end
