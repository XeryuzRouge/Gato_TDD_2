
require_relative '..\player_input'
require_relative 'tdd_classes'

RSpec.describe PlayerInput do

  let(:board) { FakeBoard.new }
	let(:player_input) { PlayerInput.new(FakeInputInterface.new, board) }

	it 'Should let make a play' do
    player_input.input_interface.input_manager.this_one("2")
    player_input.play("X")
    expect(board.player_boxes("X")).to eq ["2"]
	end

  it 'Should not let a player to play a box already played' do
    player_input.input_interface.input_manager.this_one("2")
    player_input.play("O")
    player_input.input_interface.input_manager.this_one("2")
    player_input.play("X")
    expect(board.player_boxes("O")).to eq ["2"]
    expect(board.player_boxes("X")).to eq []
  end

end