require_relative 'match_manager'

class Game

  attr_reader :players

  def initialize(player_config)
  	@output_interface = player_config.output_interface
    @input_interface = player_config.input_interface
    p1 = player_config.player_request(1)
    p2 = player_config.player_request(2)
    @players = [p1, p2]
    new_match
  end

  def new_match
  	match_manager = MatchManager.new(output_interface, input_interface, players)
  end

  private

  attr_reader :output_interface
  attr_reader :input_interface

end