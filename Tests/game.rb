require 'rspec'
require_relative '..\player_configuration'
require_relative '..\game'

class Input
  attr_reader :one
  def this_one(one)
    @one = one
  end
  def gets
    one
  end
end

class FakeOutput
  attr_reader :message
  def puts(message)
    @message = message
  end
end

RSpec.describe Game do

  context "p1 entering as human and p2 entering as computer" do

    let(:player_configuration) { PlayerConfiguration.new(input) }
    let(:input) { Input.new }

    it "Should let p1 & p2 to be h or c" do
      input.this_one("h")
      game = Game.new(player_configuration)
      expect(game.p1).to eq("h").or eq("c")
      expect(game.p2).to eq("h").or eq("c")
    end

  end

end