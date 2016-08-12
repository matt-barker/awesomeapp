puts "Hi. Welcome to Rock, Paper, Scissors"
puts "Please enter either 'rock', 'paper' or 'scissors'."
user_entry = gets.chomp.downcase
opponent_array = ["rock","paper","scissors"]
opponent_choice = opponent_array[rand(3)]
puts "You chose #{user_entry}."
puts "Your opponent chose #{opponent_choice}."
user_win = "#{user_entry} beats #{opponent_choice}, so you win!"
user_lose = "#{opponent_choice} beats #{user_entry}, so you lose!"
if user_entry == opponent_choice
 puts "You both picked #{user_entry} so it's a draw!"
elsif user_entry == "rock" and opponent_choice == "scissors"
  puts user_win
elsif user_entry == "scissors" and opponent_choice == "paper"
  puts user_win
elsif user_entry == "paper" and opponent_choice == "rock"
  puts user_win
elsif user_entry == "rock" and opponent_choice == "paper"
 puts user_lose
elsif user_entry == "scissors" and opponent_choice == "rock"
 puts user_lose
elsif user_entry == "paper" and opponent_choice == "scissors"
 puts user_lose
else puts "Sorry, #{user_entry} is not a valid choice."
end
