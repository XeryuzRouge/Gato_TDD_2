require_relative 'match_manager'

class Game

  attr_reader :players_config

  def initialize(player_config)
  	@output_interface = player_config.output_interface
    @input_interface = player_config.input_interface
    p1 = { sign: "X", config: player_config.player_request(1)}
    p2 = { sign: "O", config: player_config.player_request(2)}
    @players_config = { player1: p1, player2: p2}
    new_match
  end

  def new_match
  	 match_manager = MatchManager.new(output_interface, input_interface, players_config)
  end

  private

  attr_reader :output_interface
  attr_reader :input_interface

end