require_relative '../spec_helper'

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

  describe "#current_player" do
    it "should return the current player by calculated with move counter" do
      game = Game.new("A", "B", 3)
      expect(game.move_counter).to eql(0)
      expect(game.current_player).to eql(game.player_one)
      game.make_move("1")
      expect(game.move_counter).to eql(1)
      expect(game.current_player).to eql(game.player_two)
    end
  end

  describe "#reset" do
    it "should swap players position " do
      game = Game.new("A", "B", 3)
      game.player_one_score = 1
      expect(game.player_one_score).to eql(1)
      expect(game.player_two_score).to eql(0)
      player_one_before_swap = game.player_one
      player_two_before_swap = game.player_two
      player_one_score_before_swap = game.player_one_score
      player_two_score_before_swap = game.player_two_score
      game.swap_players
      expect(game.player_one).to eql(player_two_before_swap)
      expect(game.player_two).to eql(player_one_before_swap)
      expect(game.player_one_score).to eql(player_two_score_before_swap)
      expect(game.player_two_score).to eql(player_one_score_before_swap)
      game.reset
      expect(game.move_counter).to eql(0)
    end
  end
end
