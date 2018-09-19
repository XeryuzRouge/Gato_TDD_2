
require_relative '..\match_interface'
require_relative 'tdd_classes'

RSpec.describe MatchInterface do

  let(:input_interface) { FakeInputInterface.new(input) }
  let(:output_interface) { FakeOutputInterface.new(output) }
  let(:output) { FakeOutput.new }
  let(:input) { FakeHumanInput.new }
  let(:human_character) { "h" }
  let(:computer_character) { "c" }

  it 'should manage a human vs human match' do
    p1 = { sign: "X", config: "h" }
    p2 = { sign: "O", config:"h" }
    players_config = { player1: p1, player2: p2, human: "h", computer: "c" }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: X"
  end

  it "should manage a human vs cpu match & should recognize players sign modification" do
    p1 = { sign: "X", config: "h" }
    p2 = { sign: "O", config:"c" }
    players_config = { player1: p1, player2: p2, human: "h", computer: "c" }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: O"
  end

  it 'should manage a cpu vs cpu match' do
    p1 = { sign: "X", config: "c" }
    p2 = { sign: "O", config:"c" }
    players_config = { player1: p1, player2: p2, human: "h", computer: "c" }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "Tie"
  end

  it "should recognize players's sign and human/computer characters modification" do
    p1 = { sign: "T", config: "P" }
    p2 = { sign: "P", config:"i" }
    players_config = { player1: p1, player2: p2, human: "P", computer: "i" }
    match_interface = MatchInterface.new(output_interface, input_interface, players_config)
    expect(output.message).to eq "The winner is: P"
  end

end