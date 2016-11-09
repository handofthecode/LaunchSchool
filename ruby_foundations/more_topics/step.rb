def step(current, last, step_val)
  loop do
    yield current
    current += step_val
    break if current > last
  end
  nil
end


step(1, 10, 3) { |value| puts "value = #{value}" }