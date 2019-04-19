
require_relative '../human_input'
require_relative '../board/board'
require_relative 'tdd_classes'

RSpec.describe HumanInput do

  let(:board) { Board.new }
  let(:input) { FakeInput.new }
  let(:output) { FakeOutput.new }
  let(:human_input) { HumanInput.new(board, input, output) }

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
    expect(output.message).to eq "invalid box message"
  end

end
