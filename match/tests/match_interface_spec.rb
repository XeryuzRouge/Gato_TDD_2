
require_relative '..\match_interface'
require_relative '..\..\tests\tdd_classes'

RSpec.describe MatchInterface do

  let(:input_interface) { FakeInputInterface.new(input) }
  let(:output_interface) { FakeOutputInterface.new(output) }
  let(:output) { FakeOutput.new }
  let(:input) { FakeHumanInput.new }

  it 'should manage a human vs human match' do
    p1 = { sign: "X", config: :human }
    p2 = { sign: "O", config: :human }
    players_config = { player1: p1, player2: p2, human_player: :human, computer_player: :computer }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: X"
  end

  it "should manage a human vs cpu match & should recognize players sign modification" do
    p1 = { sign: "X", config: :human }
    p2 = { sign: "O", config: :computer }
    players_config = { player1: p1, player2: p2, human_player: :human, computer_player: :computer }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: O"
  end

  it 'should manage a cpu vs cpu match' do
    p1 = { sign: "X", config: :computer }
    p2 = { sign: "O", config: :computer }
    players_config = { player1: p1, player2: p2, human_player: :human, computer_player: :computer }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "Tie"
  end

end