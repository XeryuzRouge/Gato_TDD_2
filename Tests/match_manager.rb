
require_relative '..\board'
require_relative '..\board_display'
require_relative '..\turns_logic'
require_relative '..\human_input'
require_relative '..\cpu'
require_relative '..\match_manager'
require_relative 'tdd_classes'

RSpec.describe MatchManager do

  let(:input_interface) { FakeInputInterface.new(input) }
  let(:output_interface) { FakeOutputInterface.new(output) }
  let(:output) { FakeOutput.new }
  let(:input) { FakeHumanInput.new }

  it 'should manage a human vs human match' do
    p1 = { sign: "X", config: "h"}
    p2 = { sign: "O", config:"h"}
    players_config = { player1: p1, player2: p2}
    match_manager = MatchManager.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: X"
  end

  it "should manage a human vs cpu match & should recognize players sign modification" do
    p1 = { sign: "X", config: "h"}
    p2 = { sign: "O", config:"c"}
    players_config = { player1: p1, player2: p2}
    match_manager = MatchManager.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: O"
  end

  it 'should manage a cpu vs cpu match' do
    p1 = { sign: "X", config: "c"}
    p2 = { sign: "O", config:"c"}
    players_config = { player1: p1, player2: p2}
    match_manager = MatchManager.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "Tie"
  end

  it "should recognize players's sign modification" do
    p1 = { sign: "T", config: "h"}
    p2 = { sign: "P", config:"h"}
    players_config = { player1: p1, player2: p2}
    match_manager = MatchManager.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: T"
  end

end