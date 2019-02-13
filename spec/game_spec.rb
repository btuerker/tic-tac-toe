require 'spec_helper'
require './lib/game'

RSpec.describe Game do
  describe "#initialize" do
    it "should create a board with given size parameter" do
      game = Game.new("A", "B", 3)
      expect(game.board).to be_instance_of(Board)
      expect(game.board.board_state).to be_instance_of(Array)
      expect(game.board.board_state.length).to eql(3)
    end

    it "should create the players with given names" do
      game = Game.new("A", "B", 3)
      expect(game.player_one.name).to eql("A")
      expect(game.player_two.name).to eql("B")
    end

    it "should assign zero to move_counter, player_one_score, player_two_score" do
      game = Game.new("A", "B", 3)
      expect(game.move_counter).to eql(0)
      expect(game.player_one_score).to eql(0)
      expect(game.player_two_score).to eql(0)
    end
  end
end
