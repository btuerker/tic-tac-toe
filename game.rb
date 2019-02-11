require("./board")

class Game
  attr_accessor :player_one, :player_two, :board

  def initialize (player_one, player_two)
    @board = Board.new(3)
    @player_one = player_one
    @player_two = player_two
    @move_counter = 0
  end

  def current_player
    # TO-DO
    # return only player not name
    (@move_counter.even?) ? @player_one.name : @player_two.name
  end

  def make_move move
    player_mark = (@move_counter.even?)? 'X' : 'O'
    @move_counter += 1 if @board.make_move(move, player_mark)
  end

  def ended?
    puts @board.game_state
    @board.game_state
  end

  def reset
    @board.reset
    @move_counter = 0
    swap_players
  end

  def swap_players
    @player_one, @player_two = @player_two, @player_one
  end
end
