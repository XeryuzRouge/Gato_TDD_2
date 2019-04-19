
require_relative 'game'
require_relative 'game_configuration/player_configuration'
require_relative 'game_configuration/io_managers/remote_input'
require_relative 'game_configuration/io_managers/remote_output'
require_relative 'game_configuration/io_managers/terminal_input'
require_relative 'game_configuration/io_managers/terminal_output'

begin
  input = TerminalInput.new()
  output = TerminalOutput.new()

  if ARGV[0] == "remoteIO"
    input = RemoteInput.new()
    output = RemoteOutput.new()
  end


  Game.new(PlayerConfiguration.new(input, output))

end
