
require_relative '..\winner_checker'
require_relative 'tdd_classes'

RSpec.describe WinnerChecker do

  let(:winner_checker) {WinnerChecker.new(board)}
  let(:board) {FakeBoard.new}

  it "Should recognize if a player has won the match" do

    player_x = "X"
    player_o = "O"
    board.play_on_box("7", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("5", player_x)
    board.play_on_box("1", player_o)
    board.play_on_box("9", player_x)
    board.play_on_box("6", player_o)

    expect(winner_checker.check_for_winner(player_x)).to eq false

    board.play_on_box("3", player_x)

    expect(winner_checker.check_for_winner(player_x)).to eq "X"

  end

end
