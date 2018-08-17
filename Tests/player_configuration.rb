require 'rspec'
require_relative 'tdd_classes'
require_relative '..\player_configuration'
require_relative '..\interface'

RSpec.describe PlayerConfiguration do   

    let(:player_configuration) { PlayerConfiguration.new(interface) }
    let(:interface) { Interface.new(output, input) }
    let(:input) { FakeInput.new }
    let(:output) { FakeOutput.new }

    it "Should ask for player 1" do
      player_configuration.player_request
      expect(output.message).to eq 'player #{player}, human or computer? (h/c)'
    end

    it "Should recive player as human" do  
      input.this_one("h")
      expect(player_configuration.player_request).to eq "h"
    end

    it "Should recive player as computer" do  
      input.this_one("c")
      expect(player_configuration.player_request).to eq "c"
    end

    it "shows error if player type entered is invalid" do

      input.this_one("anything that isn't h or c, mmm... x")
      player_configuration.player_request
      expect(output.message).to eq 'h for human or c for computer..'

    end

end