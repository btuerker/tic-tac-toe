require("./game.rb")
puts "hello, world!"

puts "Player 1: Please enter your name"
player_one = gets.chomp
puts "Player 2: Please enter your name"
player_two = gets.chomp

def deplay_board state
  for i in 0...state.length
    print state[i]
    if i == 2 || i == 5
      puts
    end
  end
end



game = Game.new("Burhan", "Steph")

while game.board.game_ended? != 1
  puts "Hello !"
end
  # no one win
  game.board.make_move(0)
  game.board.make_move(2)
  game.board.make_move(1)
  game.board.make_move(4)
  game.board.make_move(3)
  game.board.make_move(6)
  game.board.make_move(5)
  game.board.make_move(7)
  game.board.make_move(8)

  deplay_board(game.board.state)
  puts game.board.game_ended?
