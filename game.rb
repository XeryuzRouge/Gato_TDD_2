require_relative 'match/match'

class Game

  attr_reader :players_config
  attr_reader :output
  attr_reader :input

  def initialize(player_config)
  	@output = player_config.output_interface
    @input = player_config.input_interface

    p1 = player_config.player_request(1)
    p2 = player_config.player_request(2)

    @players_config = { player1: p1, player2: p2 }

    new_match
  end

  def new_match
  	 results = Match.new(output, input, players_config)
  end

end