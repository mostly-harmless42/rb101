# ask the user for two numbers
# ask the user for an operation
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt('Welcome to Calculator! Enter your name: ')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('Make sure to use a valid name.')
  else
    prompt("Hi, #{name}!")
    break
  end
end

loop do    # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp.to_i
    break if valid_number?(number1)

    prompt("Hmm... that doesn't look like a valid number")
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp.to_i
    break if valid_number?(number2)

    prompt("Hmm... that doesn't look like a valid number")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?#{' '}
    1) add#{' '}
    2) subtract#{' '}
    3) multiply#{' '}
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    break if %w[1 2 3 4].include?(operator)

    prompt('Must choose 1, 2, 3, or 4.')
  end

  prompt("#{operation_to_message(operator)} the two numbers... ")

  result =  case operator
            when '1' then number1 + number2
            when '2' then number1 - number2
            when '3' then number1 * number2
            when '4' then number1.to_f / number2
            end

  prompt("The result is: #{result}")

  prompt('Do you want to perform another calucluation? (Y to calculate again)')
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt('Thanks for using the calculator! Goodbye!')
