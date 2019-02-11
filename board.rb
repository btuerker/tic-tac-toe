require("./game_state.rb")

class Board
  attr_accessor :state, :move_counter
  def initialize
    @state = ['-','-','-','-','-','-','-','-','-']
  end

  def create_board
  end

  public

  def make_move(move, player_mark)
    if valid_move?(move)
      @state[move - 1] = player_mark
      return true
    end
    return false
  end

  def valid_move?(move)
    false if move =~ /^(0|[1-9][0-9]*)/
    false if move < 1 || move > 9
    false if @state[move - 1] != '-'
    true
  end

  def test_ended?

    puts check_vertically?
    puts check_horizontally?
    puts check_cross?

  end

  def check_vertically?
    mock_state = [['O','O','O'],['X','X','X'],['X','X','X']]
    for i in 0...mock_state.length
      is_all_same = true
      for j in 0...mock_state.length - 1
        if mock_state[j][i] != mock_state[j+1][i]
          is_all_same = false
        end
      end
      return true if is_all_same
    end
     return false
  end

  def check_horizontally?
    mock_state = [['O','X','O'],['X','O','X'],['O','X','X']]
    for i in 0...mock_state.length
      is_all_same = true
      for j in 0...mock_state.length - 1
        if mock_state[i][j] != mock_state[i][j+1]
          is_all_same = false
        end
      end
      return true if is_all_same
    end
     return false
  end

  def check_cross?
    mock_state = [['X','O','O',1],['O','O','O',2],['O','O','O',3],[1,2,3,4]]
    is_all_same = true
    for i in 0...mock_state.length - 1
      if mock_state[i][i] != mock_state[i+1][i+1]
        is_all_same = false
      end
    end
    if is_all_same
      return true
    end
    is_all_same == true
    counter = mock_state.length - 1
    for i in 0...mock_state.length
      puts "#i:#{i} counter: #{counter}"
      puts "#{mock_state[counter][i]} != #{mock_state[counter][i+1]}"
      if mock_state[counter][i] != mock_state[counter-1][i+1]
        is_all_same = false
      end
      counter -= 1
    end
    return is_all_same
  end

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
  end
end


board = Board.new

puts board.test_ended?

