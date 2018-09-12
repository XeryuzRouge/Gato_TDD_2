
require_relative '..\player_configuration'
require_relative '..\game'
require_relative 'tdd_classes'

RSpec.describe Game do

  context "p1 entering as human and p2 entering as computer" do

    let(:player_configuration) { PlayerConfiguration.new(output_interface, input_interface) }
    let(:input_interface) { FakeInputInterface.new(input) }
    let(:output_interface) { FakeOutputInterface.new(output) }
    let(:input) { FakeConfigurationInput.new }
    let(:output) { FakeOutput.new }

    it "should create a new match" do
      Game.new(PlayerConfiguration.new(output_interface, input_interface))
      expect(output.message).to eq "Tie"
    end

  end

end