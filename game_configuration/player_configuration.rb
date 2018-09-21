require_relative 'game_configuration'

class PlayerConfiguration

  attr_reader :output_interface
  attr_reader :input_interface
  attr_reader :game_config

  def initialize(output_interface, input_interface)
    @output_interface = output_interface
    @input_interface = input_interface
    @game_config = GameConfiguration.new
  end

  def player_request(player = 1)
    option_selected = " "
    sign = game_config.game_characters(player)

    output_interface.clear_display
    output_interface.send "player #{player}, human or computer? (h/c)"

    loop do
      option_selected = input_interface.receive
      game_config.players_characters.each do |i|
        choice = i[0]
        i[1].each do |j|
          return { player_type: choice, sign: sign} if j == option_selected
        end
      end
      output_interface.send "h for human or c for computer.."
    end

  end

end