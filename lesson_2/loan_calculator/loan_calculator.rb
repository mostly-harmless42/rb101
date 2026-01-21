# ask the user for the loan amount, duration, and APR
# calculate the monthly interest rate and duration in months
# calculate the monthly payment using formula: 
#   m = p * (j / (1 - (1 + j)**(-n)))
# output the monthly payment

def prompt(message)
  puts "=> #{message}"
end

prompt('Welcome to Loan Calculator!')

prompt('Enter the principal amount: ')
principal = gets.chomp.to_f

prompt('Enter the loan duration in years: ')
duration_in_years = gets.chomp.to_f

prompt('Enter the annual percentage rate: ')
decimal_apr = gets.chomp.to_f / 100

duration_in_months = duration_in_years * 12

decimal_mpr = decimal_apr / 12

monthly_payment = principal * (decimal_mpr / (1 - (1 + decimal_mpr) ** (-duration_in_months)))
monthly_payment_rounded = monthly_payment.round(2)

prompt("Your monthly payment is: $#{monthly_payment_rounded}.")
prompt("Thanks for using Loan Calculator!")