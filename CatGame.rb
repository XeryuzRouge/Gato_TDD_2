require_relative 'game'
require_relative 'game_configuration/player_configuration'

begin
	if ARGV[0] == "-t"
		Game.new(PlayerConfiguration.new(TextInput.new(ARGV[1])))
	else
		Game.new(PlayerConfiguration.new(STDIN))
	end
end