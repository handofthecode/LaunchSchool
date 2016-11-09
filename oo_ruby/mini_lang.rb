class Minilang
  def initialize(string)
    @stack = []
    @register = 0
    @string = string
  end
  
  def eval
    @string.split(' ').each do |command|
      if command.to_i != 0
        @register = command.to_i
      else
        case command
        when 'PRINT'
          p @register
        when 'PUSH'
          @stack << @register
        when 'MULT'
          @register = @stack.pop * @register
        when 'POP'
          if @stack == []
            puts "Empty Stack!"
            break 
          end
          @register = @stack.pop
        when 'SUB'
          @register = @register - @stack.pop
        when 'DIV'
          @register = @register / @stack.pop
        when 'MOD'
          @register %= @stack.pop
        when 'ADD'
          @register = @register + @stack.pop
        else
          puts "Invalid token: " + command
          break
        end
      end
    end  
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PRINT PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)