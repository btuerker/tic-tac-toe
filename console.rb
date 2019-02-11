require("./game.rb")
require("./game_state.rb")
require("./player.rb")

def display_board state
  counter = 0
  3.times do
    print "  #{state[counter]} #{state[counter+1]} #{state[counter+2]}  "
    print "  #{counter+1} #{counter+2} #{counter+3}"
    puts
    counter += 3
  end
end

puts "Player 1: Please enter your name"
player_one = gets.chomp
puts "Player 2: Please enter your name"
player_two = gets.chomp

game = Game.new(Player.new(player_one), Player.new(player_two))

while true do
  system('clear')
  system('ll')
  while game.ended? == GameState::NOT_ENDED
    puts "#{game.player_one.info} \n#{game.player_two.info}"
    puts
    display_board(game.board.board_state)
    puts
    puts "It's #{game.current_player}'s turn"
    puts "Make a move from 1 - 9"
    move = gets.chomp.to_i
    until game.make_move(move)
      system('clear')
      display_board(game.board.board_state)
      puts "It's #{game.current_player}'s turn"
      puts "Please make a valid move from 0 - 9"
      move = gets.chomp.to_i
    end
    system('clear')
  end
  display_board(game.board.board_state)
  if game.ended? == GameState::X_WON
     game.player_one.increment_score
     puts "#{player_one} won the game!"
  end
  if game.ended? == GameState::O_WON
    game.player_two.increment_score
    puts "#{player_two} won the game!"
  end
  if game.ended? == GameState::TIED
    puts "Game is tied"
  end

  puts "Are you want to player again? Y/N"
  answer = gets.chomp.upcase

  until answer == 'Y' || answer == 'N'
    system('clear')
    puts "You put invalid input, try again!"
    puts "Do you want to play again? Y/N"
    answer = gets.chomp.upcase
  end
  if answer == "N"
    puts "Thank you for your playing our amazing game :) \nGood Bye"
    break
  elsif answer == 'Y'
     game.reset
  end
end
