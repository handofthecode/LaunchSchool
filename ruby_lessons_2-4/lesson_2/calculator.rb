require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_num?(num)
  num.to_i.to_s == num
end

def valid_float?(fl)
  fl.to_f.to_s == fl
end

def number?(input)
  valid_num?(input) || valid_float?(input)
end

def operator_to_message(op)
  word = case op
    when '1'
      MESSAGES['Adding']
    when '2'
      MESSAGES['Subtracting']
    when '3'
      MESSAGES['Multiplying']
    when '4'
      MESSAGES['Dividing']
         end
  word
end

prompt MESSAGES['welcome']
prompt MESSAGES['name']
name = gets.chomp

number1 = ''
loop do
  loop do
    prompt "#{name}, #{MESSAGES['number1']}"
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt "#{MESSAGES['invalid']} #{name}... #{MESSAGES['encouragement']}"
    end
  end

  number2 = ''
  loop do
    prompt MESSAGES['number2']
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt "#{MESSAGES['invalid']} #{name}... #{MESSAGES['encouragement']}"
    end
  end

  operator_prompt = <<-MSG
      What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGES['operator']
    end
  end

  prompt "#{operator_to_message(operator)}..."

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(MESSAGES['answer'] + result.to_s + "!")
  prompt(MESSAGES['again'])

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
