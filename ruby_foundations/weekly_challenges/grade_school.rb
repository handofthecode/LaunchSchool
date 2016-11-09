class School
  def initialize
  @hash = {}
  end

  def to_h
    @hash.values.each(&:sort!)
    @hash.sort.to_h
  end

  def add(name, grade)
    @hash[grade].nil? ? @hash[grade] = [name] : @hash[grade] << name
  end

  def grade(num)
    @hash[num].nil? ? [] : @hash[num]
  end
end