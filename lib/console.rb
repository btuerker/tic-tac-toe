require_relative("./game.rb")
require_relative("./game_state.rb")
require_relative("./player.rb")

def display_board state
  counter = 1
  for i in 0...state.length
    for j in 0...state.length
      if state[i][j] == '-'
        print " #{counter}"
      else
        print " #{state[i][j]}"
      end
      counter += 1
    end
    puts
  end
end

puts "Player 1: Please enter your name"
player_one_name = gets.chomp
puts "Player 2: Please enter your name"
player_two_name = gets.chomp
puts "Please add the number of game's size"
board_size = gets.chomp.to_i

game = Game.new(player_one_name, player_two_name, board_size)

while true do
  system('clear')
  system('ll')
  while game.ended? == GameState::NOT_ENDED
    puts "#{game.player_one.name}: #{game.player_one_score} \n#{game.player_two.name}: #{game.player_two_score}"
    puts
    display_board(game.board.board_state)
    puts
    puts "turn's number: #{game.move_counter + 1} It's #{game.current_player}'s turn"
    puts "Make a move from 1 - 9"
    move = gets.chomp
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
     game.player_one_score += 1
     puts "#{player_one} won the game!"
  end
  if game.ended? == GameState::O_WON
    game.player_two_score += 1
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
