require_relative 'game'
require_relative 'player_configuration'
require_relative 'output_interface'
require_relative 'input_interface'

begin
	Game.new(PlayerConfiguration.new(OutputInterface.new, InputInterface.new))
end