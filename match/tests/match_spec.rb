
require_relative '../match'
require_relative '../../tests/tdd_classes'

RSpec.describe Match do

  let(:boxes_plays) { FakeInput.new }
  let(:output) { FakeOutput.new }
  let(:match) { Match.new(players_config, boxes_plays, output) }
  let(:p1) { {:player_type=>:human, :sign=>"X"} }
  let(:p2) { {:player_type=>:computer, :sign=>"O"} }
  let(:players_config) { {player1: p1, player2: p2} }

  it 'should manage a human vs human match' do

    p2[:player_type] = :human 

    boxes_plays.try_these(["7", "8", "4", "5", "1"])

    match.start
    expect(output.message).to eq "Winner message X"
  end

  it "should manage a human vs cpu match & should recognize players sign modification" do

    boxes_plays.try_these(["1", "2", "6"])

    match.start
    expect(output.message).to eq "Winner message O"
  end

  it 'should manage a cpu vs cpu match' do

     p1[:player_type] = :computer 

    match.start
    expect(output.message).to eq "tie message"
  end

end