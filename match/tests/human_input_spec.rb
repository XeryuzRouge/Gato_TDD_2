
require_relative '..\human_input'
require_relative '..\..\tests\tdd_classes'

RSpec.describe HumanInput do

  let(:board) { FakeBoard.new }
  let(:output) { FakeOutputInterface.new }
  let(:input) { FakeInputInterface.new }
	let(:human_input) { HumanInput.new(output, input, board) }

	it 'should let make a play' do
    input.input_manager.this_one("2")
    human_input.play("X")
    expect(board.player_boxes("X")).to eq ["2"]
	end

  it 'should tell player that he is trying to play an invalid box' do
    input.input_manager.this_one("2")
    human_input.play("O")
    this_one = "2"
    then_this_one = "3"
    input.input_manager.try_these([this_one, then_this_one])
    human_input.play("X")
    expect(output.message).to eq "\ninvalid box\n"
  end

end