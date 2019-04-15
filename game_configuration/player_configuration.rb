
require_relative 'game_configuration'
require_relative 'input_module'
require_relative 'text_input'

class PlayerConfiguration

  include InputModule

  attr_reader :game_config

  def initialize(input_manager, output)
    @input_manager = input_manager
    @output = output
    init_input(input_manager)
    @game_config = GameConfiguration.new
  end

  def player_request(player = 1)
    option_selected = " "
    sign = game_config.game_characters(player)

    @output.show "player #{player}, human or computer? (h/c)"

    loop do
      option_selected = receive
      game_config.players_characters.each do |i|
        choice = i[0]
        i[1].each do |j|
          return { player_type: choice, sign: sign} if j == option_selected
        end
      end
      @output.show "h for human or c for computer.."
    end
  end

  def input_manager
    @input_manager
  end

  def output
    @output
  end

end