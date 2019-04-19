
require_relative 'game_configuration'

class PlayerConfiguration

  attr_reader :game_config
  attr_reader :input
  attr_reader :output

  def initialize(input, output)
    @input = input
    @output = output
    
    @game_config = GameConfiguration.new
  end

  def player_request(player = 1)
    option_selected = " "
    sign = game_config.game_characters(player)
    @output.configuration_options(player)

    loop do
      option_selected = @input.message
      
      game_config.players_characters.each do |i|
        choice = i[0]

        i[1].each do |j|
          return { player_type: choice, sign: sign} if j == option_selected
        end

      end

      @output.configuration_options_error
    end

  end

end
