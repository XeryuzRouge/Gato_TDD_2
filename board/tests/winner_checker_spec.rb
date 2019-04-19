
require_relative '../winner_checker'
require_relative '../board'

RSpec.describe WinnerChecker do

  let(:winner_checker) { WinnerChecker.new }
  let(:board) { Board.new }

  it "Should recognize if a player has won the match" do
    player_x = "X"
    player_o = "O"
    board.play_on_box("7", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("5", player_x)
    board.play_on_box("1", player_o)
    board.play_on_box("9", player_x)
    board.play_on_box("6", player_o)

    player_boxes = board.player_boxes(player_x)
    winning_combos = board.winning_combos

    expect(winner_checker.analyze_board(player_boxes, player_x, winning_combos)).to eq false

    board.play_on_box("3", player_x)
    player_boxes = board.player_boxes(player_x)

    expect(winner_checker.analyze_board(player_boxes, player_x, winning_combos)).to eq "X"
  end

end
