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
    return false if !move.is_a? Numeric
    return false if move < 0 || move > 9
    return false if @state[move] != '-'
    @state[move] = (@move_counter % 2 == 0)? 'X' : 'O'
    @move_counter += 1
    return true
  end

  # 0 1 2
  # 3 4 5
  # 6 7 8
  #
  #
  # X X O
  # O X O
  # X O O
  def game_ended?
    return 1 if ((@state[0] != '-') && (@state[0]== @state[1]) && (@state[0] == @state[2])) ||
                   ((@state[0] != '-') && (@state[0]== @state[3]) && (@state[0] == @state[6])) ||
                   ((@state[0] != '-') && (@state[0]== @state[4]) && (@state[0] == @state[8])) ||
                   ((@state[1] != '-') && (@state[1]== @state[4]) && (@state[1] == @state[7])) ||
                   ((@state[2] != '-') && (@state[2]== @state[5]) && (@state[2] == @state[8])) ||
                   ((@state[3] != '-') && (@state[3]== @state[4]) && (@state[3] == @state[5])) ||
                   ((@state[6] != '-') && (@state[6]== @state[7]) && (@state[6] == @state[8]))
     @state.each {|e| return -1 if e == '-'}
     return 0
  end

  
end
