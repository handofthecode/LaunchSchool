def fibonacci_three(index)
  return 1 if index == 0
  return index if index < 3
  fibonacci_three(index - 1) + fibonacci_three(index - 2) + fibonacci_three(index - 3)
end

puts fibonacci_three(7)

def fibonacci_four(index)
  return 1 if index == 0
  return index if index < 3
  return 4 if index == 3
  fibonacci_four(index - 1) + fibonacci_four(index - 2) +
  fibonacci_four(index - 3) + fibonacci_four(index - 4)
end

puts fibonacci_four(5)

def fib_mult(index)
  return 2 if index <= 1
  fib_mult(index - 1) * fib_mult(index -2)
end

puts fib_mult(3)
  