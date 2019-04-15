require_relative 'game'
require_relative 'game_configuration/player_configuration'
require_relative 'game_configuration/output'


begin
	input = STDIN
	output = Output.new(STDOUT)
	if ARGV[0] == "-it"
		input = TextOutput.new(ARGV[1])
	end
	if ARGV[2] == "-ot"
		output = Output.new(TextOutput.new(ARGV[3]))
	else
		Game.new(PlayerConfiguration.new(input, output))
	end
end