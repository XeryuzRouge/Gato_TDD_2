
require_relative '..\..\tests\tdd_classes'
require_relative '..\player_configuration'

RSpec.describe PlayerConfiguration do   

    let(:player_configuration) { PlayerConfiguration.new(output_interface, input_interface) }

    let(:output_interface) { FakeOutputInterface.new }
    let(:input_interface) { FakeInputInterface.new }

    it "Should receive player 1 as human" do
      input_interface.input_manager.this_one("h")
      expected_hash = {:player_type=>:human, :sign=>"X"}
      expect(player_configuration.player_request(1)).to eq expected_hash
    end

    it "Should receive player 2 as computer" do
      input_interface.input_manager.this_one("C")
      expect(player_configuration.player_request(2)).to eq expected_hash = {:player_type=>:computer, :sign=>"O"}
    end

    it "should loop message error until it gets a valid character" do
      input_interface.input_manager.try_these(["w", "1", "H"])
      player_configuration.player_request
      expect(output_interface.output_manager.messages[1]).to eq "h for human or c for computer.."
      expect(output_interface.output_manager.messages[2]).to eq "h for human or c for computer.."
    end

end