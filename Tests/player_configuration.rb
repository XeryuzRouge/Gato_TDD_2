require 'rspec'
require_relative '..\player_configuration'
require_relative '..\game'

class GoodInput
  def gets
    "h" 
  end
end

class ComputerInput
  def gets
    "c" 
  end
end

class BadInput
  def gets
    "x"
  end
end 

class FakeOutput
  attr_reader :message
  def puts(message)
    @message = message
  end
end

RSpec.describe PlayerConfiguration do   

    let(:game) { Game.new(player_configuration) }
    let(:player_configuration) { PlayerConfiguration.new(GoodInput.new, output) }
    let(:player_configuration_bad) { PlayerConfiguration.new(BadInput.new, output) }
    let(:output) { FakeOutput.new }

    it "Should ask for player 1" do
      player_configuration.player_request(1)
      expect(output.message).to eq 'player #{player}, human or computer? (h/c)'
    end

    it "Should recive player 1 as human" do  
      expect(player_configuration.player_request(1)).to eq "h"
    end

    it "asks for player 1" do
      p1 = "h"
      expect(game.p1).to eq(p1)
    end

    it "asks for player 2" do
      p2 = "c"
      player_configuration_c = PlayerConfiguration.new(ComputerInput.new, output)
      game_c = Game.new(player_configuration_c)

      expect(game_c.p2).to eq(p2)
    end

    it "shows error if player type entered is invalid" do

      player_configuration_bad.player_request
      expect(output.message).to eq 'h for human or c for computer..'

    end

end