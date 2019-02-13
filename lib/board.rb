require_relative("./game_state.rb")

class Board
  attr_accessor :board_state, :game_state, :move_counter
  def initialize(size)
    @board_state = Array.new(size) { Array.new(size) { '-' } }
    @game_state = GameState.state('-')
  end

  def make_move(move, player_mark)
    return false unless valid_move?(move)
    x_coord, y_coord = translate_move(move.to_i)
    return false if @board_state[x_coord][y_coord] != '-'
    @board_state[x_coord][y_coord] = player_mark
    update_game_state
    return true
  end

  def translate_move(move)
    x_coord = (move - 1) / @board_state.length
    y_coord = (move - 1) % @board_state.length
    return x_coord, y_coord
  end

  def valid_move?(move)
    return false if /^[0-9]+$/.match(move) == nil
    move = move.to_i
    return false if move < 1 || move > @board_state.length * @board_state.length
    true
  end

  def update_game_state
    update_by_vertically if @game_state == GameState::NOT_ENDED
    update_by_horizontally if @game_state == GameState::NOT_ENDED
    update_by_diagonally if @game_state == GameState::NOT_ENDED
    if @game_state == GameState::NOT_ENDED
      is_tied = true
      @board_state.each do |e|
        e.each { |x| is_tied = false if x == '-' }
      end
      @game_state = GameState.state('0') if is_tied
    end
  end

  def update_by_vertically
    for i in 0...@board_state.length
      is_all_same = true
      for j in 0...@board_state.length - 1
        if @board_state[j][i] == '-' || @board_state[j][i] != @board_state[j+1][i]
          is_all_same = false
          break
        end
      end
      if is_all_same
          @game_state = GameState.state(@board_state[0][i])
          break
      end
    end
  end

  def update_by_horizontally
    for i in 0...@board_state.length
      is_all_same = true
      for j in 0...@board_state[0].length - 1
        if @board_state[i][j] == '-' || @board_state[i][j] != @board_state[i][j+1]
          is_all_same = false
          break
        end
      end
     if is_all_same
        @game_state = GameState.state(@board_state[i][0])
        break
     end
    end

  end

  def update_by_diagonally
    is_all_same = true
    for i in 0...@board_state.length - 1
      is_all_same = false if @board_state[i][i] != @board_state[i+1][i+1]
    end
    @game_state = GameState.state(@board_state[0][0]) if is_all_same
    is_all_same = true
    counter = @board_state.length - 1
    for i in 0...@board_state.length - 1
      if @board_state[i][counter - i] == '-' || @board_state[i][counter - i] != @board_state[i + 1][counter - i - 1]
        is_all_same = false
        break
      end
    end
    @game_state = GameState.state(@board_state[@board_state.length - 1][0]) if is_all_same
  end

  def reset
    @board_state = Array.new(@board_state.length) { Array.new(@board_state.length) { '-' } }
    @game_state = GameState.state('-')
  end
end

