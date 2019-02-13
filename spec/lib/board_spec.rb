require_relative '../spec_helper'

RSpec.describe Board do
  describe "#initialize" do
    it "should create two dimensional board_state array with given size parameter" do
      board = Board.new(3)
      expect(board.board_state.length).to eql(3)
      expect(board.board_state[0].length).to eql(3)

      board = Board.new(10)
      expect(board.board_state.length).to eql(10)
      expect(board.board_state[0].length).to eql(10)
    end

    it "should've game_state variable with initial GameConstants::NOT_ENDED" do
      board = Board.new(3)
      expect(board.game_state).to eql(GameConstants::NOT_ENDED)
    end
  end

  describe "#valid_move?" do
    it "should return true when move is a number, return false when move is not a number" do
      board = Board.new(3)
      expect(board.valid_move?('3')).to be true
      expect(board.valid_move?('a')).to be false
      expect(board.valid_move?('1a')).to be false
    end

    it "should return true when number is bigger than 0 and less than (size * size) return false when is not" do
      board = Board.new(3)
      expect(board.valid_move?('0')).to be false
      expect(board.valid_move?('3')).to be true
      expect(board.valid_move?('10')).to be false
      board = Board.new(5)
      expect(board.valid_move?('0')).to be false
      expect(board.valid_move?('13')).to be true
      expect(board.valid_move?('26')).to be false
    end
  end

  describe "#translate_move" do
    it "should return translated move from number to coordinates" do
      board = Board.new(3)
      expect(board.translate_move(1)).to eql([0,0])
      expect(board.translate_move(4)).to eql([1,0])
    end
  end

  describe "#make_move" do
    it "#should return true if move is valid, return false if not" do
      board = Board.new(3)
      expect(board.make_move('3',GameConstants::PLAYER_ONE_MARK)).to be true
      expect(board.make_move('10',GameConstants::PLAYER_TWO_MARK)).to be false
    end
  end

  describe "#update_by_vertically" do
    it "should change state when finished by vertically" do
      board = Board.new(3)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      board.make_move('8', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board.reset

      board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      board.make_move('8', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board.reset

      board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      board.make_move('6', GameConstants::PLAYER_TWO_MARK)
      board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board = Board.new(5)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      board.make_move('11', GameConstants::PLAYER_ONE_MARK)
      board.make_move('16', GameConstants::PLAYER_ONE_MARK)
      board.make_move('21', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board = Board.new(4)
      board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      board.make_move('13', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)
    end
  end

  describe "#update_by_horizontally" do
    it "should change state when finished by horizontally" do
      board = Board.new(3)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      board.make_move('8', GameConstants::PLAYER_ONE_MARK)
      board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board.reset

      board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      board.make_move('6', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board.reset

      board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      board.make_move('8', GameConstants::PLAYER_TWO_MARK)
      board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board = Board.new(5)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board = Board.new(4)
      board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)
    end
  end

  describe "#update_by_diagonally" do
     it "should change game state when finished by diagonally " do
      board = Board.new(3)
      board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset

      board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board.reset

      board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board = Board.new(5)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      board.make_move('13', GameConstants::PLAYER_ONE_MARK)
      board.make_move('19', GameConstants::PLAYER_ONE_MARK)
      board.make_move('25', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board.reset
      board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      board.make_move('13', GameConstants::PLAYER_ONE_MARK)
      board.make_move('17', GameConstants::PLAYER_ONE_MARK)
      board.make_move('21', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      board = Board.new(4)
      board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      board.make_move('10', GameConstants::PLAYER_TWO_MARK)
      board.make_move('13', GameConstants::PLAYER_TWO_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      board = Board.new(4)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      board.make_move('11', GameConstants::PLAYER_ONE_MARK)
      board.make_move('16', GameConstants::PLAYER_ONE_MARK)
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)
   end
  end

  describe "#reset" do
    it "should reset the board state and game state" do
      board = Board.new(3)
      board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      initial_board = Array.new(3) { Array.new(3) { GameConstants::EMPTY_MARK } }
      expect(board.board_state == initial_board).to be false
      expect(board.game_state).to eql(GameConstants::PLAYER_ONE_WON)
      board.reset
      expect(board.board_state == initial_board).to be true
      expect(board.game_state).to eql(GameConstants::NOT_ENDED)
    end
  end
end
