
require_relative '..\player_configuration'
require_relative '..\game'
require_relative 'tdd_classes'

RSpec.describe Game do

  context "p1 entering as human and p2 entering as computer" do

    let(:player_configuration) { PlayerConfiguration.new(input, output) }
    let(:input) { FakeInput.new }
    let(:output) { FakeOutput.new }

    it "Should let p1 & p2 to be h or c" do
      input.this_one("h")
      game = Game.new(player_configuration)
      expect(game.p1).to eq("h").or eq("c")
      expect(game.p2).to eq("h").or eq("c")
    end

  end

end