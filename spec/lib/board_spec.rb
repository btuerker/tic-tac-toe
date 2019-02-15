require_relative '../spec_helper'

RSpec.describe Board do
  let(:three_size_board) { Board.new(3) }
  let(:four_size_board) { Board.new(4) }
  let(:five_size_board) { Board.new(5) }
  let(:ten_size_board) { Board.new(10) }

  describe "#initialize" do
    it "should create two dimensional board_state array with given size parameter" do
      expect(three_size_board.board_state.length).to eql(3)
      expect(three_size_board.board_state[0].length).to eql(3)
      expect(ten_size_board.board_state.length).to eql(10)
      expect(ten_size_board.board_state[0].length).to eql(10)
    end

    it "should've game_state variable with initial GameConstants::NOT_ENDED" do
      expect(three_size_board.game_state).to eql(GameConstants::NOT_ENDED)
      expect(ten_size_board.game_state).to eql(GameConstants::NOT_ENDED)
    end
  end

  describe "#valid_move?" do
    it "should return true when move is a number, return false when move is not a number" do
      expect(three_size_board.valid_move?('3')).to be true
      expect(three_size_board.valid_move?('a')).to be false
      expect(three_size_board.valid_move?('1a')).to be false
    end

    it "should return true when number is bigger than 0 and less than (size * size) return false when is not" do
      expect(three_size_board.valid_move?('0')).to be false
      expect(three_size_board.valid_move?('3')).to be true
      expect(three_size_board.valid_move?('10')).to be false

      expect(five_size_board.valid_move?('0')).to be false
      expect(five_size_board.valid_move?('13')).to be true
      expect(five_size_board.valid_move?('26')).to be false
    end
  end

  describe "#translate_move" do
    let(:three_size_board) { Board.new(3) }
    it "should return translated move from number to coordinates" do
      expect(three_size_board.translate_move(1)).to eql([0,0])
      expect(three_size_board.translate_move(2)).to eql([0,1])
      expect(three_size_board.translate_move(3)).to eql([0,2])
      expect(three_size_board.translate_move(4)).to eql([1,0])
      expect(three_size_board.translate_move(5)).to eql([1,1])
      expect(three_size_board.translate_move(6)).to eql([1,2])
      expect(three_size_board.translate_move(7)).to eql([2,0])
      expect(three_size_board.translate_move(8)).to eql([2,1])
      expect(three_size_board.translate_move(9)).to eql([2,2])

      expect(four_size_board.translate_move(1)).to eql([0,0])
      expect(four_size_board.translate_move(2)).to eql([0,1])
      expect(four_size_board.translate_move(3)).to eql([0,2])
      expect(four_size_board.translate_move(4)).to eql([0,3])
      expect(four_size_board.translate_move(5)).to eql([1,0])
      expect(four_size_board.translate_move(6)).to eql([1,1])
      expect(four_size_board.translate_move(7)).to eql([1,2])
      expect(four_size_board.translate_move(8)).to eql([1,3])
      expect(four_size_board.translate_move(9)).to eql([2,0])
      expect(four_size_board.translate_move(10)).to eql([2,1])
      expect(four_size_board.translate_move(11)).to eql([2,2])
      expect(four_size_board.translate_move(12)).to eql([2,3])
      expect(four_size_board.translate_move(13)).to eql([3,0])
      expect(four_size_board.translate_move(14)).to eql([3,1])
      expect(four_size_board.translate_move(15)).to eql([3,2])
      expect(four_size_board.translate_move(16)).to eql([3,3])
    end
  end

  describe "#make_move" do
    it "#should return true if move is valid, return false if not" do
      expect(three_size_board.make_move('3',GameConstants::PLAYER_ONE_MARK)).to be true
      expect(three_size_board.make_move('10',GameConstants::PLAYER_TWO_MARK)).to be false
    end
  end

  describe "#update_by_vertically" do
    it "should change state when finished by vertically" do
      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('8', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      three_size_board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('8', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      three_size_board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('6', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      five_size_board.reset
      five_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('11', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('16', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('21', GameConstants::PLAYER_ONE_MARK)
      expect(five_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      four_size_board.reset
      four_size_board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('13', GameConstants::PLAYER_TWO_MARK)
      expect(four_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)
    end
  end

  describe "#update_by_horizontally" do
    it "should change state when finished by horizontally" do
      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('8', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      three_size_board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('6', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      three_size_board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('8', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      five_size_board.reset
      five_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('4', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      expect(five_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      four_size_board.reset
      four_size_board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('2', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      expect(four_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

    end
  end

  describe "#update_by_diagonally" do
     it "should change game state when finished by diagonally " do
      three_size_board.reset
      three_size_board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      three_size_board.reset
      three_size_board.make_move('3', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('5', GameConstants::PLAYER_TWO_MARK)
      three_size_board.make_move('9', GameConstants::PLAYER_TWO_MARK)
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      three_size_board.reset
      five_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('7', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('13', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('19', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('25', GameConstants::PLAYER_ONE_MARK)
      expect(five_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      five_size_board.reset
      five_size_board.make_move('5', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('9', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('13', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('17', GameConstants::PLAYER_ONE_MARK)
      five_size_board.make_move('21', GameConstants::PLAYER_ONE_MARK)
      expect(five_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)

      five_size_board.reset
      four_size_board.make_move('4', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('7', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('10', GameConstants::PLAYER_TWO_MARK)
      four_size_board.make_move('13', GameConstants::PLAYER_TWO_MARK)
      expect(four_size_board.game_state).to eql(GameConstants::PLAYER_TWO_WON)

      four_size_board.reset
      four_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      four_size_board.make_move('6', GameConstants::PLAYER_ONE_MARK)
      four_size_board.make_move('11', GameConstants::PLAYER_ONE_MARK)
      four_size_board.make_move('16', GameConstants::PLAYER_ONE_MARK)
      expect(four_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)
   end
  end

  describe "#reset" do
    it "should reset the board state and game state" do
      three_size_board.reset
      three_size_board.make_move('1', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('2', GameConstants::PLAYER_ONE_MARK)
      three_size_board.make_move('3', GameConstants::PLAYER_ONE_MARK)
      initial_board = Array.new(3) { Array.new(3) { GameConstants::EMPTY_MARK } }
      expect(three_size_board.board_state == initial_board).to be false
      expect(three_size_board.game_state).to eql(GameConstants::PLAYER_ONE_WON)
      three_size_board.reset
      expect(three_size_board.board_state == initial_board).to be true
      expect(three_size_board.game_state).to eql(GameConstants::NOT_ENDED)
    end
  end
end
