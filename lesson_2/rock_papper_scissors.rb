VALID_CHOICES = ['rock', 'paper', 'scissors']

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'paper' && second == 'rock')
end

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice...")
    end
  end

  computer_choice = VALID_CHOICES.sample
  
  prompt("You choose: #{choice}. The computer chose: #{computer_choice}")
  display_results(choice, computer_choice)
  prompt("Would you like to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
