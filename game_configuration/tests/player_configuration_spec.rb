
require_relative '../../tests/tdd_classes'
require_relative '../player_configuration'

RSpec.describe PlayerConfiguration do   

  let(:output) { FakeOutput.new }
  let(:input) { FakeInput.new }
  let(:player_configuration) { PlayerConfiguration.new(input, output) }

  it "Should receive player 1 as human" do
    input.this_one("h")
    expected_hash = { :player_type=>:human, :sign=>"X" }
    expect(player_configuration.player_request(1)).to eq expected_hash
  end

  it "Should receive player 2 as computer" do
    input.this_one("C")
     expected_hash = { :player_type=>:computer, :sign=>"O" }
    expect(player_configuration.player_request(2)).to eq expected_hash
  end

  it "should loop message error until it gets a valid character" do
    input.try_these(["w", "1", "H"])
    player_configuration.player_request
    expect(output.messages[1]).to eq "configuration options error message"
    expect(output.messages[2]).to eq "configuration options error message"
  end

end