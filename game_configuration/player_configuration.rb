
require_relative 'output_interface'
require_relative 'input_interface'

class PlayerConfiguration

  attr_reader :output_interface
  attr_reader :input_interface
  attr_reader :acceptable_characters
  attr_reader :game_characters

  def initialize
    @output_interface = OutputInterface.new
    @input_interface = InputInterface.new
    @acceptable_characters = { human: ["h", "H"], computer: ["c", "C"]}
    @game_characters = { X: "X", O: "O"}
  end

  def player_request(player = 1)
    output_interface.clear_display
    option_selected = ""
    output_interface.send "player #{player}, human or computer? (h/c)"
    loop do
    option_selected = input_interface.receive
    @acceptable_characters.each do |i|
      choice = i[0]
      i[1].each do |j|
        return choice  if j == option_selected
      end
    end
    output_interface.send "h for human or c for computer.."
    end
  end

  def players_characters
    return acceptable_characters.keys
  end

end