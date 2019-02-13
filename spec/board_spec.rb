require 'spec_helper'
require './lib/board'

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

    it "should've game_state variable with initial GameState::NOT_ENDED" do
      board = Board.new(3)
      expect(board.game_state).to eql(GameState::NOT_ENDED)
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
      expect(board.make_move('3','X')).to be true
      expect(board.make_move('10','O')).to be false
    end
  end

  describe "#update_by_vertically" do
    it "should change game state" do
      board = Board.new(3)
      board.make_move('1', 'X')
      board.make_move('4', 'X')
      board.make_move('7', 'X')
      print board.board_state
      board.update_game_state
      expect(board.game_state).to eql(GameState::X_WON)
    end
  end
end
