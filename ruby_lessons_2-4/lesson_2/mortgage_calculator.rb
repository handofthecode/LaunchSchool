require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def number?(input)
  if input.to_f <= 0 || input.empty?
    return false
  else
    return true
  end
end

prompt MESSAGES['welcome']
prompt MESSAGES['name']
name = gets.chomp

loan = ''
loop do
  loop do
    prompt "#{name}, #{MESSAGES['loan']}"
    loan = gets.chomp

    if number?(loan)
      break
    else
      prompt "#{MESSAGES['invalid']} #{name}... #{MESSAGES['encouragement']}"
    end
  end

  apr = ''
  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp
    if number?(apr)
      break
    else
      prompt "#{MESSAGES['invalid']} #{name}... #{MESSAGES['encouragement']}"
    end
  end

  duration = ''
  loop do
    prompt MESSAGES['duration']
    duration = gets.chomp
    if number?(duration)
      break
    else
      prompt "#{MESSAGES['invalid']} #{name}... #{MESSAGES['encouragement']}"
    end
  end

  monthly_interest = apr.to_f * 0.01 / 12.0
  duration = duration.to_f * 12
  loan = loan.to_f

  monthly_payment = loan.to_f *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**-duration))

  prompt(MESSAGES['answer'] + "$" + sprintf("%.2f", monthly_payment).to_s)
  prompt(MESSAGES['again'])

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
