require_relative("./board.rb")

class Game
  attr_accessor :player_one, :player_two, :board, :player_one_score, :player_two_score, :move_counter

  def initialize (player_one, player_two, game_size)
    @board = Board.new(game_size)
    @player_one = player_one
    @player_two = player_two
    @move_counter = 0
    @player_one_score = 0
    @player_two_score = 0
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
    @board.game_state
  end

  def reset
    @board.reset
    @move_counter = 0
    swap_players
  end

  def swap_players
    @player_one, @player_two = @player_two, @player_one
    @player_one_score, @player_two_score = @player_two_score, @player_one_score
  end
end
