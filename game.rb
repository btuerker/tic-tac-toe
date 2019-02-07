require("./board")

class Game
  attr_accessor :player_one, :player_two, :board
  def initialize (player_one, player_two)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
  end

  def game_loop
    # print @board.state
    # puts
    # puts @board.move_counter

    # @board.make_move(1)

    # print @board.state
    # puts
    # puts @board.move_counter

    # puts @board.make_move(1)
    # print @board.state
    # puts
    # puts @board.make_move('a')
    # print @board.state
    # puts

    # @board.make_move(0)
    # @board.make_move(1)
    # @board.make_move(2)
    # @board.make_move(3)
    # @board.make_move(4)
    # @board.make_move(5)
    # @board.make_move(6)
    # @board.make_move(7)
    # @board.make_move(8)
    # @board.make_move(9)
    # print @board.state
    #

    @board.make_move(0)
    @board.make_move(3)
    @board.make_move(5)
    @board.make_move(4)
    @board.make_move(2)
    print @board.state

    puts @board.game_ended?
  end
end
