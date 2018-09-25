
require_relative '../plays_counter'
require_relative '../../Board/Board'

RSpec.describe PlaysCounter do

  let(:plays_counter) { PlaysCounter.new }
  let(:board) { Board.new }
  let(:player) { "O" }
  let(:opponent) { "X" }
  let(:corner_boxes) { ["7", "9", "1", "3"] }
  let(:cross_boxes) { ["4", "8", "6", "2"] }

  it "should return the center box of the board if available at the first 2 turns" do
    turn = 2
    expect(plays_counter.special_moves(board, player, turn)).to eq "5"
  end

  it "should return a box in a corner if the center box is already taken by the opponent" do
    turn = 2
    board.play_on_box("5", opponent)
    box_selected = plays_counter.special_moves(board, player, turn)
    expect(corner_boxes.include? box_selected).to eq true
  end

  it "should always return a corner box in the 3rd turn" do
    turn = 3
    box_selected = plays_counter.special_moves(board, player, turn)
    expect(corner_boxes.include? box_selected).to eq true
  end

  it "Should recognize & counter plays made by the opponent" do
    turn = 4

    plays_counters_list = [["7", "3", cross_boxes], ["1", "9", cross_boxes], 
                      ["8", "6", corner_boxes], ["6", "2", corner_boxes], 
                      ["2", "4", corner_boxes], ["4", "8", corner_boxes], 
                      ["7", "5", corner_boxes], ["9", "5", corner_boxes], 
                      ["1", "5", corner_boxes], ["3", "5", corner_boxes],
                      ["3", "4", ["1"]], ["1", "6", ["3"]], ["4", "9", ["7"]], 
                      ["6", "7", ["9"]], ["1", "8", ["7"]], ["3", "8", ["9"]], 
                      ["2", "7", ["1"]], ["2", "9", ["3"]], ["2", "4", ["1"]], 
                      ["2", "6", ["3"]], ["4", "8", ["7"]], ["6", "8", ["9"]]]

    plays_counters_list.each do |i|
      board.boxes.each { |k, v| board.boxes[k] = board.empty } 
      first_move = i[0]
      second_move = i[1]
      play_counter = i[2]

      board.play_on_box(first_move, opponent)
      board.play_on_box(second_move, opponent)

      box_selected = plays_counter.special_moves(board, player, turn)
      expect(play_counter.include? box_selected).to eq true
    end
  end

end