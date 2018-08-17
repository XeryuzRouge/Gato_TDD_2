
require 'rspec'
require_relative '..\board_status'

RSpec.describe BoardStatus do

  let(:board_status) { BoardStatus.new }
  let(:empty) { " " }

  it 'Should return board status as default' do

    default_status = { "7" => :empty, "8" => :empty, "9" => :empty,
                       "4" => :empty, "5" => :empty, "6" => :empty,
                       "1" => :empty, "2" => :empty, "3" => :empty }

    expect(board_status.boxes).to eq default_status

  end

  it "Should let modify any board's box's content" do

    box_selected = "5"
    turn_of = "X"
    board_status.play_on_box(box_selected, turn_of)
    expect(board_status.boxes.key(turn_of)).to eq box_selected

  end

  it "Should return all boxes with a player's value" do

    player_x = "X"
    player_o = "O"
    board_status.play_on_box("3", player_x)
    board_status.play_on_box("4", player_o)
    board_status.play_on_box("6", player_x)
    expect(board_status.player_boxes(player_x)).to eq ["6", "3"]
    expect(board_status.player_boxes(player_o)).to eq ["4"]

  end

  it "Should delegate drawing the board" do

    board_status.draw

  end

end