require_relative('./game.rb')

def display_board(state)
  counter = 1
  state.each do |row|
    row.each do |value|
      if value == GameConstants::EMPTY_MARK
        print counter.to_s
        print ' ' * (2 / counter.to_s.length)
      else
        print value
        print ' ' * (2 / value.length)
      end
      counter += 1
    end
    puts
  end
end

puts 'Player 1: Please enter your name'
player_one_name = gets.chomp
puts 'Player 2: Please enter your name'
player_two_name = gets.chomp
puts "Please add the number of game's size"
board_size = gets.chomp.to_i

game = Game.new(player_one_name, player_two_name, board_size)

while true
  system('clear')
  while game.state == GameConstants::NOT_ENDED
    puts "#{game.player_one.name}: #{game.player_one_score}"
    puts "#{game.player_two.name}: #{game.player_two_score}"
    display_board(game.board.board_state)
    puts
    puts "Turn: #{game.move_counter + 1} "
    print "It's #{game.current_player.name}'s turn"
    puts 'Make a move from 1 - 9'
    move = gets.chomp
    until game.make_move(move)
      system('clear')
      display_board(game.board.board_state)
      puts "It's #{game.current_player.name}'s turn"
      puts 'Please make a valid move from 0 - 9'
      move = gets.chomp
    end
    system('clear')
  end
  display_board(game.board.board_state)
  if game.state == GameConstants::PLAYER_ONE_WON
    game.player_one_score += 1
    puts "#{game.player_one.name} won the game!"
  end
  if game.state == GameConstants::PLAYER_TWO_WON
    game.player_two_score += 1
    puts "#{game.player_two.name} won the game!"
  end
  puts "Game is tied" if game.state == GameConstants::TIED
  puts 'Are you want to player again? Y/N'
  answer = gets.chomp.upcase

  until answer == 'Y' || answer == 'N'
    system('clear')
    puts 'You put invalid input, try again!'
    puts 'Do you want to play again? Y/N'
    answer = gets.chomp.upcase
  end
  if answer == 'N'
    puts 'Thank you for your playing our amazing game :) \nGood Bye'
    break
  elsif answer == 'Y'
    game.reset
  end
end
