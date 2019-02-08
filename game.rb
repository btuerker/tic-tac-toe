require("./board")

class Game
  attr_accessor :player_one, :player_two, :board

  def initialize (player_one, player_two)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
  end

  def current_player
    (@board.move_counter % 2 == 0) ? @player_one.name : @player_two.name
  end

  def make_move move
    @board.make_move(move)
  end
  def ended?
    @board.ended?
  end

  def swap_players
    @player_one, @player_two = @player_two, @player_one
  end
end
