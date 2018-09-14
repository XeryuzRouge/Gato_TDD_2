require_relative 'game'
require_relative 'game_configuration/player_configuration'

begin
	Game.new(PlayerConfiguration.new)
end