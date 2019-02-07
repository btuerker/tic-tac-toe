require("./game.rb")
puts "hello, world!"

def display_board state
  for i in 0...state.length
    print state[i]
    if i == 2 || i == 5
      puts
    end
  end
  puts
end

puts "Player 1: Please enter your name"
player_one = gets.chomp
puts "Player 2: Please enter your name"
player_two = gets.chomp

game = Game.new("Burhan", "Steph")

# To-Do -> add wrappers for indirections something like game.ended? instead of game.board.game_ended
while game.ended? != 1
  puts "It's #{game.current_player}'s turn"
  puts "Make a move from 0 - 9"
  move = gets.chomp.to_i
  until game.board.make_move(move)
    system('clear')
    display_board(game.board.state)
    puts "It's #{game.current_player}'s turn"
    puts "Please make a valid move from 0 - 9"
    move = gets.chomp.to_i
  end
  system('clear')
  display_board(game.board.state)
end
