require_relative 'game'
require_relative 'game_configuration/player_configuration'
require_relative 'game_configuration/output_interface'
require_relative 'game_configuration/input_interface'

begin
	Game.new(PlayerConfiguration.new(OutputInterface.new, InputInterface.new))
end