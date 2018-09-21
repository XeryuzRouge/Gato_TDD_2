
require_relative '../game'
require_relative '../game_configuration/player_configuration'
require_relative 'tdd_classes'

RSpec.describe Game do

  let(:player_config) { PlayerConfiguration.new(output, input) }
  let(:output) { FakeOutputInterface.new }
  let(:input) { FakeInputInterface.new }

  it 'should carry out a match' do

    input.try_these(["c", "c"])
    game = Game.new(player_config)
    expect(game.output.last_message).to eq "Tie"

  end

end