require("./game_state.rb")

class Board
  attr_accessor :state, :move_counter
  def initialize
    @state = ['-','-','-','-','-','-','-','-','-']
    @move_counter = 0
  end

  public

  def make_move(move)
    valid_move?(move)
  end

  def valid_move?(move)
    return false if move =~ /^(0|[1-9][0-9]*)/
    return false if move < 1 || move > 9
    return false if @state[move - 1] != '-'
    @state[move - 1] = (@move_counter % 2 == 0) ? 'X' : 'O'
    @move_counter += 1
    return true
  end
  # 0 1 2
  # 3 4 5
  # 6 7 8
  # XOX
  # OXO
  # XXO
  def ended?
    return GameState.state(@state[0]) if ((@state[0] != '-') && (@state[0]== @state[1]) && (@state[0] == @state[2]))
    return GameState.state(@state[0]) if ((@state[0] != '-') && (@state[0]== @state[3]) && (@state[0] == @state[6]))
    return GameState.state(@state[0]) if ((@state[0] != '-') && (@state[0]== @state[4]) && (@state[0] == @state[8]))
    return GameState.state(@state[1]) if ((@state[1] != '-') && (@state[1]== @state[4]) && (@state[1] == @state[7]))
    return GameState.state(@state[2]) if ((@state[2] != '-') && (@state[2]== @state[5]) && (@state[2] == @state[8]))
    return GameState.state(@state[2]) if ((@state[2] != '-') && (@state[2]== @state[4]) && (@state[2] == @state[6]))
    return GameState.state(@state[3]) if ((@state[3] != '-') && (@state[3]== @state[4]) && (@state[3] == @state[5]))
    return GameState.state(@state[6]) if ((@state[6] != '-') && (@state[6]== @state[7]) && (@state[6] == @state[8]))
    @state.each {|e| return GameState.state('-') if e == '-'}
    return GameState.state('0')
  end

  def reset
    @state = ['-','-','-','-','-','-','-','-','-']
    @move_counter = 0
  end
end
