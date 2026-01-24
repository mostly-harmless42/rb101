CHOICES = %w[rock paper scissors lizard spock]

WIN = { 'rock' => ['scissors', 'lizard'],
        'paper' => ['rock', 'spock'],
        'scissors' => ['paper', 'lizard'],
        'lizard' => ['paper', 'spock'],
        'spock' => ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WIN[first].include?(second)
end

def abbreviated_choice(str)
  CHOICES.find { |choice| choice.start_with?(str) }
end

def player_choice
  player = ''
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    player = gets.chomp
    player = abbreviated_choice(player) if abbreviated_choice(player)
    break if CHOICES.include?(player)
    puts("That's not a valid choice.")
  end
  player
end

def display_round_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

loop do
  prompt("Welcome to Rock Paper Scissors! Best of 3 wins!")

  player_score = 0
  computer_score = 0

  loop do
    puts
    prompt("Player: #{player_score}  Computer: #{computer_score}")
    player = player_choice()
    computer = CHOICES.sample

    prompt("You chose: #{player}. Computer chose: #{computer}.")
    display_round_results(player, computer)

    player_score += 1 if win?(player, computer)
    computer_score += 1 if win?(computer, player)

    break if player_score == 3 || computer_score == 3
  end

  puts
  prompt("Final scores:")
  prompt("Player: #{player_score} vs Computer: #{computer_score}")
  winner = player_score == 3 ? 'You' : 'Computer'
  prompt("#{winner} won the game!")

  puts
  prompt("Do you want to play again? (Y to play again)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing! Goodbye")
