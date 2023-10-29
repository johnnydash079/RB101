LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  operator = case op
             when '1' then 'Adding'
             when '2' then 'Subtracting'
             when '3' then 'Mulitplying'
             when '4' then 'Dividing'
             end

  operator
end

prompt(MESSAGES[LANGUAGE]["welcome"])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES[LANGUAGE]["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do # loop for first number input
    prompt(MESSAGES[LANGUAGE]["first_number"])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES[LANGUAGE]["valid_number"])
    end
  end

  number2 = ''
  loop do # loop for second number input
    prompt(MESSAGES[LANGUAGE]["second_number"])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES[LANGUAGE]["valid_number"])
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do # loop for operator selection
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[LANGUAGE]["operator_reinforce"])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =
    case operator
    when '1' then number1.to_i() + number2.to_i()
    when '2' then number1.to_i() - number2.to_i()
    when '3' then number1.to_i() * number2.to_i()
    when '4' then number1.to_f() / number2.to_f()
    end

  prompt("The result is #{result}")

  prompt(MESSAGES[LANGUAGE]["play_again?"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES[LANGUAGE]["goodbye"])
