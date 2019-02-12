require_relative("./game_state.rb")

class Board
  attr_accessor :board_state, :game_state, :move_counter
  def initialize(size)
    @board_state = Array.new(size) { Array.new(size) { '-' } }
    @game_state = GameState.state('-')
    @size = size
  end

  def make_move(move, player_mark)
    x_coord, y_coord = translate_move(move)
    if valid_move?(x_coord, y_coord)
      @board_state[x_coord][y_coord] = player_mark
      update_game_state
      return true
    end
    return false
  end

  def translate_move(move)
    x_coord = (move - 1) / @size
    y_coord = (move - 1) % @size
    return x_coord, y_coord
  end

  def valid_move?(x_coord, y_coord)
    # false if move =~ /^(0|[1-9][0-9]*)/
    # false if move < 1 || move > @size * @size
    false if @board_state[x_coord][y_coord] != '-'
    true
  end

  def update_game_state
    ended_by_vertically?
    ended_by_horizontally?
    ended_by_diagonally?
  end

  def ended_by_vertically?
    for i in 0...@board_state.length
      is_all_same = true
      for j in 0...@board_state.length - 1
        if @board_state[j][i] != @board_state[j+1][i]
          is_all_same = false
        end
      end
      if is_all_same
        @game_state = GameState.state(@board_state[0][i])
        return true
      end
    end
     return false
  end

  def ended_by_horizontally?
    for i in 0...@board_state.length
      is_all_same = true
      for j in 0...@board_state[0].length - 1
        if @board_state[i][j] != @board_state[i][j+1]
          is_all_same = false
        end
      end
      if is_all_same
        @game_state = GameState.state(@board_state[i][0])
        return true
      end
    end
     return false
  end

  def ended_by_diagonally?
    is_all_same = true
    for i in 0...@board_state.length - 1
      if @board_state[i][i] != @board_state[i+1][i+1]
        is_all_same = false
      end
    end
    if is_all_same
      @game_state = GameState.state(@board_state[0][0])
      return true
    end
    is_all_same = true
    counter = @board_state.length - 1
    for i in 0...@board_state.length - 1
      puts "i#{i} counter:#{counter}"
      if @board_state[i][counter - i] != @board_state[i + 1][counter - i - 1]
        is_all_same = false
        break
      end
    end
    if is_all_same
      @game_state = GameState.state(@board_state[@board_state.length - 1][0])
    end
    return is_all_same
  end

  def reset
    @board_state = Array.new(@board_state.length) { Array.new(@board_state.length) { '-' } }
    @game_state = GameState.state('-')
  end
end
