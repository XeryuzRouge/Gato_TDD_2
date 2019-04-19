
require_relative '../board'
require_relative '../../tests/tdd_classes'

RSpec.describe Board do

  let(:board) { Board.new }
  let(:empty) { " " }

  it 'should return board status as default' do
    default_status = { "7" => empty, "8" => empty, "9" => empty,
        "4" => empty, "5" => empty, "6" => empty,
        "1" => empty, "2" => empty, "3" => empty }

    expect(board.boxes).to eq default_status
  end

  it "should let modify any board's box's content" do
    box_selected = "5"
    turn_of = "X"
    board.play_on_box(box_selected, turn_of)

    expect(board.boxes.key(turn_of)).to eq box_selected

  end

  it "should return all boxes with a player's value" do
    player_x = "X"
    player_o = "O"
    board.play_on_box("3", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("6", player_x)

    expect(board.player_boxes(player_o)).to eq ["4"]

  end

  it "should return all boxes with a opponent's value" do
    player_x = "X"
    player_o = "O"
    board.play_on_box("3", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("6", player_x)

    expect(board.opponent_boxes(player_x)).to eq ["4"]
  end

  it "should return boxes available" do
    player_x = "X"
    player_o = "O"
    board.play_on_box("3", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("6", player_x)

    expect(board.available_boxes).to eq ["7", "8", "9", "5", "1", "2"]
  end

   it "should return winning combos updated" do
    expected_combo =  [["X", "O", 1], ["X", 8, 9], ["X", 5, 3], 
        [8, 5, 2], [9, "X", 3], ["O", 5, "X"], 
        [1, 2, 3], [1, 5, 9]]

    player_x = "X"
    player_o = "O"
    board.play_on_box("7", player_x)
    board.play_on_box("4", player_o)
    board.play_on_box("6", player_x)

    expect(board.winning_combos).to eq expected_combo
  end

end
