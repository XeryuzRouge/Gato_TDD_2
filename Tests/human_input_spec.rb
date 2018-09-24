
require_relative '..\human_input'
require_relative 'tdd_classes'

RSpec.describe HumanInput do

  let(:board) { FakeBoard.new }
  let(:output) { FakeOutput.new }
  let(:input) { FakeInput.new }
	let(:human_input) { HumanInput.new(board) }

  before(:each) do
    human_input.init_output(output)
    human_input.init_input(input)
  end

	it 'should let make a play' do
    input.this_one("2")
    human_input.play("X")
    expect(board.player_boxes("X")).to eq ["2"]
	end

  it 'should tell player that he is trying to play an invalid box' do
    input.this_one("2")
    human_input.play("O")
    this_one = "2"
    then_this_one = "3"
    input.try_these([this_one, then_this_one])
    human_input.play("X")
    expect(output.message).to eq "\ninvalid box\n"
  end

end