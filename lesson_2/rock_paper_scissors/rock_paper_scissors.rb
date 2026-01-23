CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def display_results(choice, computer_choice)
  if (choice == 'rock' && computer_choice == 'scissors') ||
     (choice == 'paper' && computer_choice == 'rock') ||
     (choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif (choice == 'rock' && computer_choice == 'paper') ||
        (choice == 'paper' && computer_choice == 'scissors') ||
        (choice == 'scissors' && computer_choice == 'rock')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = gets.chomp
    break if CHOICES.include?(choice)
    puts("That's not a valid choice.")
  end

  computer_choice = CHOICES.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again? (Y to play again)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing! Goodbye")