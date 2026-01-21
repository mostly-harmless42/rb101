# ask the user for the loan amount, duration, and APR
# calculate the monthly interest rate and duration in months
# calculate the monthly payment using formula:
#   m = p * (j / (1 - (1 + j)**(-n)))
# output the monthly payment

def prompt(message)
  puts "=> #{message}"
end

def numeric?(value)
  !!(value.match?(/\d+/))
end

def valid?(value)
  numeric?(value) && value.to_f > 0
end

prompt('Welcome to Loan Calculator!')

loop do
  prompt('Enter the principal amount: ')
  principal = gets.chomp

  until valid?(principal)
    prompt("Oops... please enter a valid positive number: ")
    principal = gets.chomp
  end

  prompt('Enter the loan duration in years: ')
  duration_in_years = gets.chomp

  until valid?(duration_in_years)
    prompt("Oops... please enter a valid positive number: ")
    duration_in_years = gets.chomp
  end

  prompt('Enter the annual percentage rate: ')
  apr = gets.chomp

  until valid?(apr)
    prompt("Oops... please enter a valid positive number: ")
    apr = gets.chomp
  end

  duration_in_months = duration_in_years.to_f * 12

  decimal_mpr = apr.to_f / 100 / 12

  monthly_payment =
    principal.to_f *
    (decimal_mpr / (1 - ((1 + decimal_mpr)**(-duration_in_months))))

  monthly_payment_rounded = monthly_payment.round(2)

  prompt("Your monthly payment is: $#{monthly_payment_rounded}.")

  prompt("Enter 'Y' to perform another calculation: ")
  break unless gets.chomp.downcase == 'y'
end

prompt("Thanks for using Loan Calculator!")
