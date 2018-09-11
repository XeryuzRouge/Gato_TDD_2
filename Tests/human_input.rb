
require_relative '..\human_input'
require_relative 'tdd_classes'

RSpec.describe HumanInput do

  let(:board) { FakeBoard.new }
	let(:human_input) { HumanInput.new(FakeInputInterface.new, board) }

	it 'Should let make a play' do
    human_input.input_interface.input_manager.this_one("2")
    human_input.play("X")
    expect(board.player_boxes("X")).to eq ["2"]
	end

  it 'Should not let a player to play a box already played' do
    human_input.input_interface.input_manager.this_one("2")
    human_input.play("O")
    human_input.input_interface.input_manager.this_one("2")
    human_input.play("X")
    expect(board.player_boxes("O")).to eq ["2"]
    expect(board.player_boxes("X")).to eq []
  end

end