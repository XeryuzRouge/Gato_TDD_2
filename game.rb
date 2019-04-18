require_relative 'match/match'

class Game

  attr_reader :players_config
  attr_reader :result

  def initialize(player_config)
    @input = player_config.input
    @output = player_config.output

    p1 = player_config.player_request(1)
    p2 = player_config.player_request(2)

    @players_config = { player1: p1, player2: p2 }

    new_match
  end

  def new_match
     new_match = Match.new(players_config, @input, @output)
     @result = new_match.start
  end

end