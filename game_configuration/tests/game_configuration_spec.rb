
require_relative '../game_configuration'

RSpec.describe GameConfiguration do

  let(:game_config) { GameConfiguration.new }

  it 'should give a hash listing the valid characters for human and cpu' do
    expected_hash = { human: ["h", "H"], computer: ["c", "C"] }

    expect(game_config.players_characters).to eq expected_hash
  end

  it 'must give the respective sign of the player' do
    player = 2
    expected_sign = "O"
    expect(game_config.game_characters(player)).to eq expected_sign

    player = 1
    expected_sign = "X"
    expect(game_config.game_characters(player)).to eq expected_sign
  end

end
