require_relative("./board.rb")
require_relative("./player.rb")

module GameConstants
  EMPTY_MARK = '-'
  PLAYER_ONE_MARK = 'X'
  PLAYER_TWO_MARK = 'O'
  TIED_MARK = '0'

  PLAYER_ONE_WON = 'Player one won the game!'
  PLAYER_TWO_WON = 'Player two won the game!'
  TIED = 'Game is tied'
  NOT_ENDED = 'Game is not ended'

  def self.state(state)
    return PLAYER_ONE_WON if state == PLAYER_ONE_MARK
    return PLAYER_TWO_WON if state == PLAYER_TWO_MARK
    return TIED           if state == TIED_MARK
    return NOT_ENDED      if state == EMPTY_MARK
  end
end

class Game
  attr_accessor :player_one, :player_two, :board, :player_one_score, :player_two_score, :move_counter

  def initialize (player_one_name, player_two_name, board_size)
    @board = Board.new(board_size)
    @player_one = Player.new(player_one_name)
    @player_two = Player.new(player_two_name)
    @move_counter = 0
    @player_one_score = 0
    @player_two_score = 0
  end

  def current_player
    (@move_counter.even?) ? @player_one : @player_two
  end

  def make_move move
    player_mark = (@move_counter.even?)? GameConstants::PLAYER_ONE_MARK : GameConstants::PLAYER_TWO_MARK
    @move_counter += 1 if @board.make_move(move, player_mark)
  end

  def state
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

