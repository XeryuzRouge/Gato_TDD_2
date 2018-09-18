require_relative 'match_interface'

class Game

  def initialize(player_config)
  	output = player_config.output_interface
    input = player_config.input_interface
    accepted_characters = player_config.acceptable_characters
    game_characters = player_config.game_characters

    p1_config = player_config.player_request(1)
    p2_config = player_config.player_request(2)
    p1 = { sign: game_characters[:X], config: p1_config}
    p2 = { sign: game_characters[:O], config: p2_config}

    players_config = { player1: p1, player2: p2, human: accepted_characters[:human], 
                     computer: accepted_characters[:computer] }

    new_match(output, input, players_config)
  end

  def new_match(output, input, players_config)
  	 match_manager = MatchInterface.new(output, input, players_config)
  end

end