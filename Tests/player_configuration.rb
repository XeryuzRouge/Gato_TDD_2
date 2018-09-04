
require_relative 'tdd_classes'
require_relative '..\player_configuration'

RSpec.describe PlayerConfiguration do   

    let(:player_configuration) { PlayerConfiguration.new(output_interface, input_interface) }

    let(:output_interface) { FakeOutputInterface.new }
    let(:input_interface) { FakeInputInterface.new }

    it "Should ask for player 1" do
      player_configuration.player_request(1)
      player = 1
      expect(output_interface.message).to eq "player #{player}, human or computer? (h/c)"
    end

    it "Should recive player as human" do
      input_interface.input_manager.this_one("h")
      expect(player_configuration.player_request).to eq "h"
    end

    it "Should receive player as computer" do
      input_interface.input_manager.this_one("c")
      expect(player_configuration.player_request).to eq "c"
    end

    it "Should show error if character isn't valid" do
      input_interface.input_manager.this_one("w")
      player_configuration.player_request
      expect(output_interface.message).to eq "h for human or c for computer.."
    end

end