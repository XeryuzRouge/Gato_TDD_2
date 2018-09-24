
require_relative '../game'
require_relative '../game_configuration/player_configuration'
require_relative 'tdd_classes'

RSpec.describe Game do

  let(:player_config) { PlayerConfiguration.new }
  let(:input) { FakeInput.new }

  before(:each) do
    player_config.init_input(input)
  end

  it 'should carry out a match' do

    input.try_these(["c", "c"])
    game = Game.new(player_config)
    expect(game.result).to eq "Tie"

  end

end